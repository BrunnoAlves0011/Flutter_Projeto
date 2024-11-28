import 'package:flutter/material.dart';
import '/controller/ListarController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Pizzasal extends StatefulWidget {
  const Pizzasal({super.key});

  @override
  State<Pizzasal> createState() => _PizzasalState();
}

class _PizzasalState extends State<Pizzasal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizzas Salgadas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'Carrinho');
        },
        backgroundColor: Colors.orangeAccent,
        child: const Icon(Icons.local_grocery_store_sharp),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(
          stream: ListarController().sallist(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData || snapshot.data!.size == 0) {
              return const Center(
                child: Text(
                  'Nenhuma pizza encontrada.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              );
            }

            final dados = snapshot.data!;

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Duas colunas
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4, // Proporção altura/largura
              ),
              itemCount: dados.size,
              itemBuilder: (context, index) {
                String id = dados.docs[index].id;
                dynamic item = dados.docs[index].data();

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'DetalhesS',
                          arguments: id); // Envia apenas o ID
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                item['image'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item['nome'] ?? 'Pizza sem nome',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'R\$ ${item['valor'] != null ? item['valor'].toDouble().toStringAsFixed(2) : '0.00'}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.orangeAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
