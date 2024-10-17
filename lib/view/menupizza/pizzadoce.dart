import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '/model/menu.dart';
import 'package:get_it/get_it.dart';
import '/model/carrinho.dart';

final Carrinho srv = GetIt.instance<Carrinho>();

class Pizzadoce extends StatefulWidget {
  const Pizzadoce({super.key});

  @override
  State<Pizzadoce> createState() => _PizzadoceState();
}

class _PizzadoceState extends State<Pizzadoce> {
  var lista = [];

  @override
  void initState() {
    lista = MenuPizzaDoce.gerarDados();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza Doce'),
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
            mainAxisExtent: 300,
            //crossAxisSpacing: 10,
            //mainAxisSpacing: 10,
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
                        width: 250, fit: BoxFit.scaleDown),
                    Text(
                      lista[index].nome,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                onTap: () {
                  MenuPizzaDoce dados = lista[index];
                  Navigator.pushNamed(context, 'DetalhesD', arguments: dados);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
