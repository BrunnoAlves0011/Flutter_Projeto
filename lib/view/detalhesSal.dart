import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:get_it/get_it.dart';
import '/model/carrinho.dart';
import '/model/carrinhoservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/model/mensagem.dart';

final Cart srv = GetIt.instance<Cart>();

class DetalhesSView extends StatefulWidget {
  const DetalhesSView({super.key});

  @override
  State<DetalhesSView> createState() => _DetalhesSViewState();
}

class _DetalhesSViewState extends State<DetalhesSView> {
  @override
  Widget build(BuildContext context) {
    // Recebe o ID do item enviado como argumento
    final String itemId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do Item"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<DocumentSnapshot>(
          // Busca o documento específico pelo ID
          stream: FirebaseFirestore.instance
              .collection('PizzaSal') // Certifique-se de que o nome da coleção está correto
              .doc(itemId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return const Center(
                child: Text(
                  'Item não encontrado.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              );
            }

            final dados = snapshot.data!.data() as Map<String, dynamic>;

            return ListView(
              children: [
                // Imagem do Item
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return ImageNetwork(
                        image: dados['image'] ?? '',
                        height: 300,
                        width: constraints.maxWidth, // Usa o tamanho máximo disponível no layout
                        curve: Curves.easeIn,
                        fitWeb: BoxFitWeb.cover,
                        onLoading: const CircularProgressIndicator(
                            color: Colors.indigoAccent),
                        onError: const Icon(Icons.error, color: Colors.red),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Ingredientes
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ingredientes',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          dados['desc'] ?? 'Descrição não disponível.',
                          style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ),

                // Preço
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Preço',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'R\$ ${dados['valor']?.toDouble().toStringAsFixed(2) ?? '0.00'}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Botão Adicionar ao Carrinho
                Center(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.orangeAccent,
                    ),
                    onPressed: () {
                      // Adiciona o item ao carrinho
                      srv.addItem(
                        Carrinho(
                          id: itemId,
                          image: dados['image'] ?? '',
                          pizza: dados['nome'] ?? '',
                          valor: dados['valor'] ?? 0,
                        ),
                      );
                      // Notifica o usuário
                      adicionado(context, 'Item adicionado ao carrinho');
                    },
                    icon: const Icon(Icons.add_shopping_cart, size: 24),
                    label: const Text(
                      'Adicionar ao Carrinho',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
