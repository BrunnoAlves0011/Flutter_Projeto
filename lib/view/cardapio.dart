// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '/model/menu.dart';
import 'package:get_it/get_it.dart';
import '/model/carrinho.dart';
import '../controller/login_controller.dart';

final Carrinho srv = GetIt.instance<Carrinho>();

class CardapioView extends StatefulWidget {
  const CardapioView({super.key});

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {
  var lista = [];
  @override
  void initState() {
    lista = Menu.gerarDados();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(child: Text('Tarefas')),
            FutureBuilder<String>(
              future: LoginController().usuarioLogado(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        LoginController().logout();
                        Navigator.pushReplacementNamed(context, 'Login');
                      },
                      icon: Icon(Icons.exit_to_app, size: 20),
                      label: Text(snapshot.data.toString()),
                    ),
                  );
                }
                return Text('');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'Carrinho');
        },
        backgroundColor: Colors.orangeAccent,
        child: const Icon(Icons.local_grocery_store_sharp),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: lista.length,
          itemBuilder: (contexto, index) {
            return Card(
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(lista[index].image,
                        width: 300, fit: BoxFit.fill),
                    Text(
                      lista[index].nome,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                onTap: () {
                  if (lista[index].nome == 'Pizzas Salgadas') {
                    Navigator.pushNamed(context, 'PizzaSal');
                  } else if (lista[index].nome == 'Pizzas Doces') {
                    Navigator.pushNamed(context, 'PizzaDoce');
                  } else {
                    Navigator.pushNamed(context, 'Bebida');
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
