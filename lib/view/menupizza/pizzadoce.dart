import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '/model/menu.dart';
import 'package:get_it/get_it.dart';
import '/model/carrinho.dart';

final CarrinhoService srv = GetIt.instance<CarrinhoService>();

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
        title: Text('Pizzas Doces'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orangeAccent,
        child: const Icon(Icons.local_grocery_store_sharp),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (contexto, index) {
            return Card(
              child: ListTile(
                title: Text(lista[index].nome, style: TextStyle(fontSize: 22)),
                subtitle: Text(
                  lista[index].desc,
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                leading: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset(lista[index].image),
                ),
                trailing: Icon(Icons.arrow_right),
                hoverColor: Colors.red.shade100,
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
