// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ResetView extends StatefulWidget {
  const ResetView({super.key});

  @override
  State<ResetView> createState() => _ResetViewState();
}

class _ResetViewState extends State<ResetView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final messagerKey = GlobalKey<ScaffoldMessengerState>();

  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();
  var txtValor3 = TextEditingController();
  var txtvalor4 = TextEditingController();
  bool val = false;
  bool _showPassword = false;

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
                  controller: txtValor2,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'example@mail.com',
                      hintStyle: TextStyle(color: Colors.black38)),
                  validator: (value) {
                    //val = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value);
                    if (value != 'jose@gmail.com') {
                      return 'Informe um email cadastrado';
                    }else {
                      return null;
                    }
                  }),
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Email enviado com sucesso.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ))),
                    );
                    Navigator.pushReplacementNamed(context, 'Login');
                  }
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
