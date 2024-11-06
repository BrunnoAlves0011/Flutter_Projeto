// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../controller/login_controller.dart';

class ResetView extends StatefulWidget {
  const ResetView({super.key});

  @override
  State<ResetView> createState() => _ResetViewState();
}

class _ResetViewState extends State<ResetView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final messagerKey = GlobalKey<ScaffoldMessengerState>();
  final LoginController _loginController = LoginController();

  var txtValor1 = TextEditingController();

  bool val = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redefinir Senha'),
        titleTextStyle: TextStyle(fontSize: 30, color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 225, 79, 79),
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context, 'Login');
              },
              icon: Icon(Icons.logout, color: Colors.white))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(360, 60),
                  backgroundColor: const Color.fromARGB(255, 225, 79, 79),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  _loginController.esqueceuSenha(context, txtValor1.text);
                },
                child: Text('Redefinir Senha'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
