// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final messagerKey = GlobalKey<ScaffoldMessengerState>();
  final LoginController _loginController = LoginController();

  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      hintStyle: TextStyle(color: Colors.black38),
                      suffixIcon: GestureDetector(
                        child: Icon(
                            _showPassword == false
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white),
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      )),
                  obscureText: _showPassword == false ? true : false),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(360, 60),
                  backgroundColor: const Color.fromARGB(255, 225, 79, 79),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  _loginController.login(context, txtValor1.text, txtValor2.text);
                },
                child: Text('Entrar na Conta'),
              ),
              SizedBox(height: 20),
              Text('Não tem uma conta?', style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(30, 30),
                  textStyle: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'Cadastro');
                  if (formkey.currentState!.validate()) {}
                },
                child: Text('Registrar-se'),
              ),
              SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(30, 30),
                  textStyle: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'Reset');
                  if (formkey.currentState!.validate()) {}
                },
                child: Text('Esqueceu a senha?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
