// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/model/carrinhoservice.dart';

final Cart srv = GetIt.instance<Cart>();

class CarrinhoView extends StatefulWidget {
  const CarrinhoView({super.key});

  @override
  State<CarrinhoView> createState() => _CarrinhoViewState();
}

class _CarrinhoViewState extends State<CarrinhoView> {

  // Função para salvar os pedidos no Firebase
  Future<void> _finalizarCompra() async {
    if (srv.items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('O carrinho está vazio!')),
      );
      return;
    }

    // Criar o pedido no Firebase
    try {
      final pedido = {
        'status': 'Finalizado',
        'total': srv.totalAmount,
        'itens': srv.items.map((item) {
          return {
            'id': item.product.id,
            'nome': item.product.pizza,
            'quantidade': item.quantity,
            'valor': item.product.valor,
          };
        }).toList(),
        'data': Timestamp.now(),
      };

      // Salvar no Firebase (coleção "pedidos")
      await FirebaseFirestore.instance.collection('pedidos').add(pedido);

      // Limpar o carrinho após salvar
      setState(() {
        srv.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Compra finalizada com sucesso!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao finalizar a compra: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Total: R\$${srv.totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: srv.items.isEmpty
                  ? Center(
                      child: Text(
                        'Seu carrinho está vazio!',
                        style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                      ),
                    )
                  : ListView.builder(
                      itemCount: srv.items.length,
                      itemBuilder: (contexto, index) {
                        final cartItem = srv.items[index];
                        return Card(
                          child: ListTile(
                            title: Text(
                              cartItem.product.pizza,
                              style: const TextStyle(fontSize: 22),
                            ),
                            subtitle: Text(
                              'Quantidade: ${cartItem.quantity}\nPreço: R\$${cartItem.product.valor.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            leading: Container(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                cartItem.product.image,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.error, color: Colors.red);
                                },
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  srv.removeItem(cartItem.product.id); // Remover item do carrinho
                                });
                              },
                            ),
                            hoverColor: Colors.red.shade100,
                          ),
                        );
                      },
                    ),
            ),
            // Botão para concluir a compra
            ElevatedButton(
              onPressed: _finalizarCompra,
              child: Text('Concluir Compra'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20), // Espaçamento abaixo do botão
          ],
        ),
      ),
    );
  }
}
