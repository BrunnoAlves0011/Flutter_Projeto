// ignore_for_file: prefer_const_constructors
//Import pacotes flutter
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'model/carrinho.dart';

//Import Telas flutter
import 'view/login.dart';
import 'view/cadastro.dart';
//import 'view/Reset.dart';
import 'view/cardapio.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<CarrinhoService>(CarrinhoService());
  
  var srv = getIt<CarrinhoService>();

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
          'Login': (context) => LoginView(),
          'Cadastro': (context) => CadastroView(),
          //'Reset': (context) => ResetView(),
          'Cardapio': (context) => CardapioView(),
          //'principal' : (context) => PrincipalView(),
          //'detalhes' : (context) => DetalhesView(),
        });
  }
}
