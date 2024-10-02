// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '/model/menu.dart';

class DetalhesView extends StatefulWidget {
  const DetalhesView({super.key});

  @override
  State<DetalhesView> createState() => _DetalhesViewState();
}

class _DetalhesViewState extends State<DetalhesView> {
  @override
  Widget build(BuildContext context) {
    //
    // Receber os dados que foram enviados por argumento
    // ( *^-^)ρ(^0^* )
    final MenuPizzaSal dados = ModalRoute.of(context)!.settings.arguments as MenuPizzaSal;
    return Scaffold(
      appBar: AppBar(
        title: Text(dados.nome),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
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
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                dados.desc,
                style: TextStyle(fontSize: 18)),
            ),
            ListTile(
              title: Text(
                'Preço',
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                dados.valor,
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              //title: Text('Adicionar ao carrinho', style: TextStyle(fontSize: 18)),
              subtitle: Icon(Icons.local_grocery_store, size: 40),
            )
          ],
        ),
      ),
    );
  }
}
