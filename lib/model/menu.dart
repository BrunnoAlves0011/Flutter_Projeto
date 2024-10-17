// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
int x = 0;

class Menu{
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

class MenuBebidas {
  final String id;
  final String nome;
  final String desc;
  final double valor;
  final String image;

  MenuBebidas(this.id, this.nome, this.desc, this.valor, this.image);

  static List<MenuBebidas> gerarDados() {
    List<MenuBebidas> list = [];
    list.add(MenuBebidas('26' ,"Refrigerante Lata (350ml)",
        "Coca-Cola, Guaraná, Sprite.", 6.00 , "lib/images/refri.jpg"));
    list.add(MenuBebidas('27' ,
        "Suco Natual (300ml)",
        "Laranja, Limão, Abacaxi, Morango, Maracujá, Goiaba, Uva, Caju, Abacaxi com Hortelã ou Acerola.",
        10.00,
        "lib/images/suco-frutas.png"));
    list.add(MenuBebidas('28' ,"Água Mineiral", "Com ou sem gás.", 5.00, "lib/images/agua.png"));
    list.add(MenuBebidas('29' ,"Cerveja Artesanal (600ml)",
        "Diversos rótulos regionais.", 18.00, "lib/images/cerves.jpg"));
    return list;
  }
}

class MenuPizzaSal {
  final String id;
  final String nome;
  final String desc;
  final double valor;
  final String image;

  MenuPizzaSal(this.id, this.nome, this.desc, this.valor, this.image);

  static List<MenuPizzaSal> gerarDados() {
    List<MenuPizzaSal> list = [];

    list.add(MenuPizzaSal('1' ,'Alho-Poró com Bacon',
        'Alho-Poró,Bacon,Cebola,Mussarela,Tomate Seco', 29.90, 'lib/images/alho.jpeg'));
    list.add(MenuPizzaSal(
        '2' ,'Calabresa', 'Linguiça Calabresa,Tomate,Mussarela', 29.90, 'lib/images/calabresa.jpg'));
    list.add(MenuPizzaSal(
        '3' ,'Bacon', 'Molho de tomate, mussarela, bacon', 35.00, 'lib/images/bacon.jpg'));
    list.add(MenuPizzaSal(
        '4' ,
        'Baiana',
        'Molho de tomate, mussarela, carne seca, pimenta, cebola',
        43.00,
        'lib/images/baiana.jpg'));
    list.add(MenuPizzaSal(
        '5' ,'Escarola', 'Molho de tomate, mussarela, escarola', 34.00, 'lib/images/mato.png'));
    list.add(MenuPizzaSal('6' ,
        'Frango com Catupiry',
        'Molho de tomate, mussarela, frango desfiado, catupiry',
        37.00,
        'lib/images/frango.jpg'));
    list.add(MenuPizzaSal('7' ,
        'Gorgonzola', 'Molho de tomate, mussarela, gorgonzola', 37.00, 'lib/images/gorgo.jpg'));
    list.add(MenuPizzaSal('8' ,
        'Margherita', 'Molho de tomate, mussarela, manjericão', 30.00, 'lib/images/marguerita.jpg'));
    list.add(MenuPizzaSal('9' ,
        'Mexicana',
        'Molho de tomate, mussarela, carne moída, pimenta jalapeño, cebola',
        42.00,
        'lib/images/mexico.jpg'));
    list.add(MenuPizzaSal('10' ,
        'Milho', 'Molho de tomate, mussarela, milho', 32.00, 'lib/images/milho.jpeg'));
    list.add(MenuPizzaSal('11' ,'Napolitana',
        'Molho de tomate, mussarela, tomate, alho, orégano', 32.00, 'lib/images/napolitana.jpg'));
    list.add(MenuPizzaSal('12' ,
        'Palmito', 'Molho de tomate, mussarela, palmito', 36.00, 'lib/images/palmito.jpg'));
    list.add(MenuPizzaSal('13' ,
        'Paulista',
        'Molho de tomate, mussarela, presunto, ovo, cebola, azeitona',
        38.00,
        'lib/images/Paulista.jpeg'));
    list.add(MenuPizzaSal('14' ,
        'Pepperoni', 'Molho de tomate, mussarela, pepperoni', 35.00, 'lib/images/Pepperoni.jpg'));
    list.add(MenuPizzaSal('15' ,
        'Portuguesa',
        'Molho de tomate, mussarela, presunto, ovo, cebola, azeitona',
        38.00,
        'lib/images/Portuguesa.jpg'));
    list.add(MenuPizzaSal('16' ,
        'Quatro Queijos',
        'Molho de tomate, mussarela, parmesão, gorgonzola, provolone',
        40.00,
        'lib/images/queijos.jpg'));
    list.add(MenuPizzaSal('17' ,'Rúcula com Tomate Seco',
        'Molho de tomate, mussarela, rúcula, tomate seco', 38.00, 'lib/images/tomate.jpg'));
    return list;
  }
}

class MenuPizzaDoce {
  final String id;
  final String nome;
  final String desc;
  final double valor;
  final String image;

  MenuPizzaDoce(this.id, this.nome, this.desc, this.valor, this.image);

  static List<MenuPizzaDoce> gerarDados() {
    List<MenuPizzaDoce> list = [];

    list.add(MenuPizzaDoce('18' ,'Abacaxi',
        'Massa de pizza, abacaxi, chocolate branco', 32.00, 'lib/images/abacaxi.jpeg'));
    list.add(MenuPizzaDoce('19' ,'Banana com Canela',
        'Massa de pizza, banana, açúcar, canela', 28.00, 'lib/images/abacaxi_canela.jpeg'));
    list.add(MenuPizzaDoce('20' ,'Frutas Vermelhas',
        'Massa de pizza, frutas vermelhas, chantilly', 38.00, 'lib/images/frutas_vermelhas.jpeg'));
    list.add(MenuPizzaDoce(
        '21' ,'M&Ms', 'Massa de pizza, chocolate derretido, M&Ms', 34.00, 'lib/images/mem.jpeg'));
    list.add(MenuPizzaDoce('22' ,'Morango com Chocolate',
        'Massa de pizza, morango, chocolate derretido', 35.00, 'lib/images/morango.jpeg'));
    list.add(MenuPizzaDoce(
        '23' ,'Nutella', 'Massa de pizza, Nutella, morango', 38.00, 'lib/images/nuttela.jpeg'));
    list.add(MenuPizzaDoce('24' ,'Oreo',
        'Massa de pizza, creme de Oreo, pedaços de Oreo', 35.00, 'lib/images/oreo.jpeg'));
    list.add(MenuPizzaDoce(
        '25' ,'Romeu e Julieta', 'Massa de pizza, goiabada, queijo', 30.00, 'lib/images/romeu.jpg'));
    return list;
  }
}
