import '/model/carrinho.dart';

class Cart {
  List<CartItem> items = [];

  void addItem(Carrinho product) {
    // Verificar se o item já está no carrinho
    CartItem? existingItem = items.firstWhere((item) => item.product.id == product.id, orElse: () => CartItem(product: product, quantity: 0));
    
    if (existingItem.quantity > 0) {
      existingItem.quantity++;
    } else {
      items.add(CartItem(product: product, quantity: 1));
    }
  }

  void removeItem(String productId) {
    items.removeWhere((item) => item.product.id == productId);
  }

  double get totalAmount {
    return items.fold(0.0, (sum, item) => sum + (item.product.valor * item.quantity));
  }

  int get itemCount {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }
}
