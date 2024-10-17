double valor = 0;
double temp = 0;

class Carrinho {
  final String id;
  final String image;
  final String pizza;
  final double valor;

  Carrinho({required this.id, required this.image, required this.pizza, required this.valor});

}

class CartItem {
  final Carrinho product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}