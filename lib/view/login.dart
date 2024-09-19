// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final messagerKey = GlobalKey<ScaffoldMessengerState>();

  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: messagerKey,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 120, 10, 10),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('lib/images/pizza.png'),
                SizedBox(height: 20),
                TextFormField(
                  controller: txtValor1,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'example@mail.com',
                      hintStyle: TextStyle(color: Colors.black38)),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: txtValor2,
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: '********',
                      hintStyle: TextStyle(color: Colors.black38)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(360, 60),
                    backgroundColor: const Color.fromARGB(255, 225, 79, 79),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      Navigator.pushNamed(context, 'Cardapio');
                    }
                  },
                  child: Text('Entrar na Conta'),
                ),
                SizedBox(height: 20),
                Text('Não tem uma conta?', style: TextStyle(fontSize: 12)),
                SizedBox(height: 10),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(30, 30),
                    textStyle: TextStyle(fontSize: 12),
                  ),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {}
                  },
                  child: Text('Registrar-se'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
