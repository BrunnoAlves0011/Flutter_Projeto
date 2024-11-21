// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Menu {
  final String nome;
  final String desc;
  final String image;

  Menu(this.nome, this.desc, this.image);

  static List<Menu> gerarDados() {
    List<Menu> list = [];
    list.add(Menu("Pizzas Salgadas", "Pizza saborosa", "lib/images/ptela.jpg"));
    list.add(Menu("Pizzas Doces", "Docinho", "lib/images/pdoce.jpg"));
    list.add(Menu("Bebidas", "Hidrate-se", "lib/images/bebida.jpeg"));

    return list;
  }
}

class Bebida {
  final String uid;
  final String nome;
  final String desc;
  final double valor;
  final String image;

  Bebida(this.uid, this.nome, this.desc, this.valor, this.image);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'nome': nome,
      'desc': desc,
      'valor': valor,
      'image': image
    };
  }

  factory Bebida.fromJson(Map<String, dynamic> json) {
    return Bebida(
        json['uid'], json['nome'], json['desc'], json['valor'], json['image']);
  }
}
class PizzaSal {
  final String uid;
  final String nome;
  final String desc;
  final double valor;
  final String image;

  PizzaSal(this.uid, this.nome, this.desc, this.valor, this.image);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'nome': nome,
      'desc': desc,
      'valor': valor,
      'image': image
    };
  }

  factory PizzaSal.fromJson(Map<String, dynamic> json) {
    return PizzaSal(
        json['uid'], json['nome'], json['desc'], json['valor'], json['image']);
  }
}

class PizzaDoce {
  final String uid;
  final String nome;
  final String desc;
  final double valor;
  final String image;

  PizzaDoce(this.uid, this.nome, this.desc, this.valor, this.image);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'nome': nome,
      'desc': desc,
      'valor': valor,
      'image': image
    };
  }

  factory PizzaDoce.fromJson(Map<String, dynamic> json) {
    return PizzaDoce(
        json['uid'], json['nome'], json['desc'], json['valor'], json['image']);
  }
}