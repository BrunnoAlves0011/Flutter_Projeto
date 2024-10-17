// ignore_for_file: prefer_const_constructors
//Import pacotes flutter
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projeto1/model/menu.dart';
import 'package:get_it/get_it.dart';

//Import classes flutter
import 'model/carrinho.dart';
import 'model/carrinhoservice.dart';

//Import Telas flutter
import 'view/login.dart';
import 'view/cadastro.dart';
import 'view/reset.dart';
import 'view/detalhesSal.dart';
import 'view/detalhesDoc.dart';
import 'view/detalhesBeb.dart';
import 'view/cardapio.dart';
import 'view/menupizza/pizzasal.dart';
import 'view/menupizza/pizzadoce.dart';
import 'view/menupizza/bebida.dart';
import 'view/carrinhoView.dart';

final getIt = GetIt.instance;

void main() {
  GetIt.instance.registerSingleton<Cart>(Cart());
  
  var srv = getIt<Cart>();

  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MainApp(),
  ));
}

class MainApp extends StatelessWidget {  
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'Login',
        routes: {
          'Login'    : (context) => LoginView(),
          'Cadastro' : (context) => CadastroView(),
          'Reset'    : (context) => ResetView(),
          'Cardapio' : (context) => CardapioView(),
          'DetalhesS' : (context) => DetalhesSView(),
          'DetalhesD' : (context) => DetalhesDView(),
          'DetalhesB' : (context) => DetalhesBView(),
          'PizzaSal' : (context) => Pizzasal(),
          'PizzaDoce': (context) => Pizzadoce(),
          'Bebida'   : (context) => Bebida(),
          'Carrinho' : (context) => CarrinhoView(),
        });
  }
}
