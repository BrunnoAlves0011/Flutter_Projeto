import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '/model/menu.dart';
import 'package:get_it/get_it.dart';
import '/model/carrinho.dart';

final CarrinhoService srv = GetIt.instance<CarrinhoService>();

class Bebida extends StatefulWidget {
  const Bebida({super.key});

  @override
  State<Bebida> createState() => _BebidaState();
}

class _BebidaState extends State<Bebida> {
  var lista = [];

  @override
  void initState() {
    lista = MenuBebidas.gerarDados();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bebidas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(lista[index].image,
                        width: 250, fit: BoxFit.fill),
                    Text(
                      lista[index].nome,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                onTap: () {
                  //MenuPizzaDoce dados = lista[index];
                  //Navigator.pushNamed(context, 'Detalhes', arguments: dados);                  
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
