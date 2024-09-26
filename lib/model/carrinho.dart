double valor = 0;

class Carrinho {
  final String pizza;
  final String bebida;

  Carrinho(this.pizza, this.bebida);

}

class CarrinhoService {
  List<Carrinho> carrinho = [];

  void adicionarPizza(Carrinho pizza, double value) {
    carrinho.add(pizza);
    valor = valor + value;
  }

  void adicionarBebida(Carrinho bebida, double value) {
    carrinho.add(bebida);
    valor = valor + value;
  }

  void removerPizza(index, double value) {
    carrinho.remove(index);
    valor = valor - value;
  }

  void removerBebida(index, double value){
    carrinho.add(index);
    valor = valor - value;
  }

}