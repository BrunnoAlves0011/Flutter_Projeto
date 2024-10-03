// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '/model/menu.dart';
import 'package:get_it/get_it.dart';
import '/model/carrinho.dart';

final CarrinhoService srv = GetIt.instance<CarrinhoService>();

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
        title: Text('Cardarpio'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, 'Login', (Route<dynamic> route) => false);
            }, 
            icon: Icon(Icons.logout))
        ],
        ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (contexto, index) {
            return Card(
              child: ListTile(
                title: Text(
                  lista[index].nome,
                  style: TextStyle(fontSize: 22),
                ),
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
                ),
                trailing: Icon(Icons.arrow_right),
                hoverColor: Colors.red.shade100,
                onTap: () {
                  //retornar o item da lista selecionado

                  Menu dados = lista[index];
                  if(dados.nome == "Pizzas Salgadas"){
                    Navigator.pushNamed(context, 'PizzaSal');
                  }else if(dados.nome == "Pizzas Doces"){
                    Navigator.pushNamed(context, 'PizzaDoce');
                  }else if(dados.nome == "Bebidas"){
                    Navigator.pushNamed(context, "Bebida");
                  }else{
                    //Navigator.pushNamed(context, "Carrinho");
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
