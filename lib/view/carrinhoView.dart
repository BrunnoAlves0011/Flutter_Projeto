// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '/model/menu.dart';
import 'package:get_it/get_it.dart';
import '/model/carrinhoservice.dart';

final Cart srv = GetIt.instance<Cart>();

class CarrinhoView extends StatefulWidget {
  const CarrinhoView({super.key});

  @override
  State<CarrinhoView> createState() => _CarrinhoViewState();
}

class _CarrinhoViewState extends State<CarrinhoView> {
  final Cart _cart = srv;

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
                'Total: R\$${_cart.totalAmount.toStringAsFixed(2)}',
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
              child: ListView.builder(
                itemCount: _cart.items.length,
                itemBuilder: (contexto, index) {
                  final cartItem = _cart.items[index];
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
                        child: Image.asset(cartItem.product.image),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _cart.removeItem(cartItem.product.id); // Remover item do carrinho
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
              onPressed: () {
                // Adicione a lógica para concluir a compra aqui
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Compra concluída!')),
                );
              },
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