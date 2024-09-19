class Menu {
  final String nome;
  final String desc;
  final String foto;

  Menu(this.nome, this.desc, this.foto);

  static List<Menu> gerarDados(){
    List<Menu> list = [];
    list.add(Menu("Pizzas Salgadas", "Pizza saborosa", "Foto1"));
    list.add(Menu("Pizzas Gourmets", "A moda do chefe", "Foto1"));
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

  static List<MenuBebidas> gerarDados(){
    List<MenuBebidas> list = [];
    list.add(MenuBebidas(
      "Refrigerante Lata (350ml)", 
      "Coca-Cola, Guaraná, Sprite.", 
      "6,00", 
      "Foto1"));
    list.add(MenuBebidas(
      "Suco Natual (300ml)", 
      "Laranja, Limão, Abacaxi, Morango, Maracujá, Goiaba, Uva, Caju, Abacaxi com Hortelã ou Acerola.", 
      "10,00", 
      "Foto1"));
    list.add(MenuBebidas(
      "Água Mineiral", 
      "Com ou sem gás.", 
      "5,00", 
      "Foto1"));
    list.add(MenuBebidas(
      "Cerveja Artesanal (600ml)", 
      "Diversos rótulos regionais.", 
      "18,00", 
      "Foto1"));
    return list;
  }
}

