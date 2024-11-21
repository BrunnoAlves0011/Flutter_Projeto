import '/model/carrinho.dart';

class Cart {
  final List<CartItem> _items = [];

  // Adicionar item ao carrinho
  void addItem(Carrinho product) {
    final existingIndex = _items.indexWhere((item) => item.product.id == product.id);

    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(product: product, quantity: 1));
    }
  }

  // Atualizar a quantidade de um item no carrinho
  void updateItemQuantity(String productId, int quantity) {
    final existingIndex = _items.indexWhere((item) => item.product.id == productId);

    if (existingIndex >= 0) {
      if (quantity > 0) {
        _items[existingIndex].quantity = quantity;
      } else {
        _items.removeAt(existingIndex);
      }
    }
  }

  // Remover um item específico do carrinho
  void removeItem(String productId) {
    final existingIndex = _items.indexWhere((item) => item.product.id == productId);

    if (existingIndex >= 0) {
      if (_items[existingIndex].quantity > 1) {
        _items[existingIndex].quantity--;
      } else {
        _items.removeAt(existingIndex);
      }
    }
  }

  // Limpar o carrinho
  void clear() {
    _items.clear();
  }

  // Obter todos os itens no carrinho
  List<CartItem> get items => List.unmodifiable(_items);

  // Calcular o valor total do carrinho
  double get totalAmount {
    return _items.fold(0.0, (sum, item) => sum + (item.product.valor * item.quantity));
  }

  // Contar o número total de itens no carrinho
  int get totalItemsCount {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }
}
