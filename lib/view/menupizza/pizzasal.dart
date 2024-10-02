
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '/model/menu.dart';
import 'package:get_it/get_it.dart';
import '/model/carrinho.dart';

final CarrinhoService srv = GetIt.instance<CarrinhoService>();

class Pizzasal extends StatefulWidget {
  const Pizzasal({super.key});

  @override
  State<Pizzasal> createState() => _PizzasalState();
}

class _PizzasalState extends State<Pizzasal> {
  var lista = [];

  @override
  void initState() {
    lista = MenuPizzaSal.gerarDados();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizzas Salgadas'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, 'Cardapio', (Route<dynamic> route) => false);
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
                title: Text(lista[index].nome, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lista[index].desc,  
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                leading: Container(
                  margin: EdgeInsets.only(top: 8),
                  height: 50,
                  width: 50,
                  child: Image.asset(lista[index].image),
                ),
                trailing: Icon(Icons.arrow_right),
                hoverColor: Colors.red.shade100,
                shape: Border.symmetric(horizontal: BorderSide(color: Colors.black), vertical: BorderSide(color: Colors.black)),
                onTap: () {
                  MenuPizzaSal dados = lista[index];
                  Navigator.pushNamed(context, 'Detalhes', arguments: dados);
                  //retornar o item da lista selecionado
                  //Menu dados = lista[index];
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
