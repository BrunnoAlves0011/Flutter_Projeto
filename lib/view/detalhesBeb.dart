// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:get_it/get_it.dart';
import '/model/carrinho.dart';
import '/model/carrinhoservice.dart';
import '/model/menu.dart';

final Cart srv = GetIt.instance<Cart>();

class DetalhesBView extends StatefulWidget {
  const DetalhesBView({super.key});

  @override
  State<DetalhesBView> createState() => _DetalhesBViewState();
}

class _DetalhesBViewState extends State<DetalhesBView> {
  final Cart cart = Cart();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final messagerKey = GlobalKey<ScaffoldMessengerState>();

  var lista = [];

  @override
  Widget build(BuildContext context) {
    //
    // Receber os dados que foram enviados por argumento
    // ( *^-^)ρ(^0^* )
    //
    final MenuBebidas dados =
        ModalRoute.of(context)!.settings.arguments as MenuBebidas;
    return Scaffold(
      appBar: AppBar(
        title: Text(dados.nome),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          key: formkey,
          children: [
            ImageNetwork(
                image: dados.image,
                height: 300,
                width: 300,
                curve: Curves.easeIn,
                fitWeb: BoxFitWeb.cover,
                onLoading:
                    const CircularProgressIndicator(color: Colors.indigoAccent),
                onError: const Icon(Icons.error, color: Colors.red)),
            ListTile(
              title: Text(
                'Ingredientes',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(dados.desc,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
            ),
            ListTile(
              title: Text(
                'Preço',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                dados.valor.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
            //SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                //minimumSize: Size(50, 60),
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                //Carrinho newPizza = Carrinho(id: dados.id, image: dados.image, pizza: dados.nome, valor: dados.valor);
                srv.addItem(Carrinho(
                    id: dados.id,
                    image: dados.image,
                    pizza: dados.nome,
                    valor: dados.valor));
                //srv.adicionarPizza(Carrinho(dados.nome, dados.desc), dados.valor);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Adicionado ao carrinho')),
                );
              },
              child: Icon(Icons.local_grocery_store_sharp,
                  size: 45, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
