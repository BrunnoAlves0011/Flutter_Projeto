import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/model/mensagem.dart';

class LoginController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  void criarConta(context, nome, email, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      FirebaseFirestore.instance.collection('usuarios').add({
        "uid": res.user!.uid.toString(),
        "nome": nome,
      });
      sucesso(context, 'Usuario criado com sucesso.');
      Navigator.pop(context);
    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          erro(context, 'O email ja está em uso');
          break;
        case 'invalid-email':
          erro(context, 'O email é invalido');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }

  void login(context, email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      sucesso(context, 'Usuario autenticado com sucesso!');
      Navigator.pushReplacementNamed(context, 'Cardapio');
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          erro(context, 'O formato de email é invalido');
          break;
        case 'user-not-found':
          erro(context, 'Usuario não encontrado');
          break;
        case 'wrong-password':
          erro(context, 'Senha Incorreta');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }

  void esqueceuSenha(context, String email) {
    if (email.isNotEmpty) {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      sucesso(context, 'E-mail enviado com sucesso!');
    } else {
      erro(context, 'Informe o e-mail para recuperar a senha!');
    }
    Navigator.pop(context);
  }

  logout() {
    FirebaseAuth.instance.signOut();
  }

  idUsuario() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future<String> usuarioLogado() async {
    var usuario = '';
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: idUsuario())
        .get()
        .then(
      (resultado) {
        usuario = resultado.docs[0].data()['nome'] ?? '';
      },
    );
    return usuario;
  }
}
