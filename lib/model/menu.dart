// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Menu {
  final String nome;
  final String desc;
  final foto;

  Menu(this.nome, this.desc, this.foto);

  static List<Menu> gerarDados() {
    List<Menu> list = [];
    list.add(Menu("Pizzas Salgadas", "Pizza saborosa", "Foto1"));
    list.add(Menu("Pizzas Doces", "Docinho", "Foto1"));
    list.add(Menu("Bebidas", "Hidrate-se", "Foto1"));

    return list;
  }
}

class MenuBebidas {
  final String nome;
  final String desc;
  final String valor;
  final String foto;

  MenuBebidas(this.nome, this.desc, this.valor, this.foto);

  static List<MenuBebidas> gerarDados() {
    List<MenuBebidas> list = [];
    list.add(MenuBebidas("Refrigerante Lata (350ml)",
        "Coca-Cola, Guaraná, Sprite.", "6,00", "Foto1"));
    list.add(MenuBebidas(
        "Suco Natual (300ml)",
        "Laranja, Limão, Abacaxi, Morango, Maracujá, Goiaba, Uva, Caju, Abacaxi com Hortelã ou Acerola.",
        "10,00",
        "Foto1"));
    list.add(MenuBebidas("Água Mineiral", "Com ou sem gás.", "5,00", "Foto1"));
    list.add(MenuBebidas("Cerveja Artesanal (600ml)",
        "Diversos rótulos regionais.", "18,00", "Foto1"));
    return list;
  }
}

class MenuPizzaSal {
  final String nome;
  final String desc;
  final String valor;
  final String image;

  MenuPizzaSal(this.nome, this.desc, this.valor, this.image);

  static List<MenuPizzaSal> gerarDados() {
    List<MenuPizzaSal> list = [];

    list.add(MenuPizzaSal('Alho-Poró com Bacon',
        'Alho-Poró,Bacon,Cebola,Mussarela,Tomate Seco', '29.90', 'lib/images/alho.jpg'));
    list.add(MenuPizzaSal(
        'Calabresa', 'Linguiça Calabresa,Tomate,Mussarela', '29.90', 'lib/images/calabresa.jpg'));
    list.add(MenuPizzaSal(
        'Bacon', 'Molho de tomate, mussarela, bacon', '35,00', 'lib/images/bacon.jpg'));
    list.add(MenuPizzaSal(
        'Baiana',
        'Molho de tomate, mussarela, carne seca, pimenta, cebola',
        '43,00',
        'lib/images/baiana.jpg'));
    list.add(MenuPizzaSal(
        'Escarola', 'Molho de tomate, mussarela, escarola', '34,00', 'lib/images/mato.jpg'));
    list.add(MenuPizzaSal(
        'Frango com Catupiry',
        'Molho de tomate, mussarela, frango desfiado, catupiry',
        '37,00',
        'lib/images/frango.jpg'));
    list.add(MenuPizzaSal(
        'Gorgonzola', 'Molho de tomate, mussarela, gorgonzola', '37,00', 'lib/images/gorgo.jpg'));
    list.add(MenuPizzaSal(
        'Margherita', 'Molho de tomate, mussarela, manjericão', '30,00', 'lib/images/marguerita.jpg'));
    list.add(MenuPizzaSal(
        'Mexicana',
        'Molho de tomate, mussarela, carne moída, pimenta jalapeño, cebola',
        '42,00',
        'lib/images/mexico.jpg'));
    list.add(MenuPizzaSal(
        'Milho', 'Molho de tomate, mussarela, milho', '32,00', 'lib/images/milho.jpg'));
    list.add(MenuPizzaSal('Napolitana',
        'Molho de tomate, mussarela, tomate, alho, orégano', '32,00', 'lib/images/napolitana.jpg'));
    list.add(MenuPizzaSal(
        'Palmito', 'Molho de tomate, mussarela, palmito', '36,00', 'lib/images/palmito.jpg'));
    list.add(MenuPizzaSal(
        'Paulista',
        'Molho de tomate, mussarela, presunto, ovo, cebola, azeitona',
        '38,00',
        'lib/images/Paulista.jpg'));
    list.add(MenuPizzaSal(
        'Pepperoni', 'Molho de tomate, mussarela, pepperoni', '35,00', 'lib/images/Pepperoni.jpg'));
    list.add(MenuPizzaSal(
        'Portuguesa',
        'Molho de tomate, mussarela, presunto, ovo, cebola, azeitona',
        '38,00',
        'lib/images/Portuguesa.jpg'));
    list.add(MenuPizzaSal(
        'Quatro Queijos',
        'Molho de tomate, mussarela, parmesão, gorgonzola, provolone',
        '40,00',
        'lib/images/queijos.jpg'));
    list.add(MenuPizzaSal('Rúcula com Tomate Seco',
        'Molho de tomate, mussarela, rúcula, tomate seco', '38,00', 'lib/images/tomate.jpg'));
    return list;
  }
}

class MenuPizzaDoce {
  final String nome;
  final String desc;
  final String valor;
  final String image;

  MenuPizzaDoce(this.nome, this.desc, this.valor, this.image);

  static List<MenuPizzaDoce> gerarDados() {
    List<MenuPizzaDoce> list = [];

    list.add(MenuPizzaDoce('Abacaxi',
        'Massa de pizza, abacaxi, chocolate branco', 'RS32,00', 'lib/images/abacaxi.jpg'));
    list.add(MenuPizzaDoce('Banana com Canela',
        'Massa de pizza, banana, açúcar, canela', 'RS28,00', 'lib/images/abacaxi_canela.jpg'));
    list.add(MenuPizzaDoce('Frutas Vermelhas',
        'Massa de pizza, frutas vermelhas, chantilly', 'RS38,00', 'lib/images/frutas_vermelhas.jpg'));
    list.add(MenuPizzaDoce(
        'M&Ms', 'Massa de pizza, chocolate derretido, M&Ms', 'RS34,00', 'lib/images/mem.jpg'));
    list.add(MenuPizzaDoce('Morango com Chocolate',
        'Massa de pizza, morango, chocolate derretido', 'RS35,00', 'lib/images/morango.jpg'));
    list.add(MenuPizzaDoce(
        'Nutella', 'Massa de pizza, Nutella, morango', 'RS38,00', 'lib/images/nuttela.jpg'));
    list.add(MenuPizzaDoce('Oreo',
        'Massa de pizza, creme de Oreo, pedaços de Oreo', 'RS35,00', 'lib/images/oreo.jpg'));
    list.add(MenuPizzaDoce(
        'Romeu e Julieta', 'Massa de pizza, goiabada, queijo', 'RS30,00', 'lib/images/romeu.jpg'));
    return list;
  }
}
