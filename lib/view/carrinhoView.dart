import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '/model/menu.dart';
import 'package:get_it/get_it.dart';
import '/model/carrinhoservice.dart';

final Carrinho srv = GetIt.instance<Carrinho>();

class CarrinhoView extends StatefulWidget {
  const CarrinhoView({super.key});

  @override
  State<CarrinhoView> createState() => _CarrinhoViewState();
}

class _CarrinhoViewState extends State<CarrinhoView> {
  var lista = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ListView.builder(
          itemCount: srv.carrinhos.length,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
