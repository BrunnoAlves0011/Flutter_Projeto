import '/model/carrinho.dart';

class CarrinhoService {
  List<Carrinho> carrinhos = [];

  void adicionarPizza(Carrinho nome, double value) {
    carrinhos.add(nome);
    valor = valor + value;
  }

  void adicionarBebida(Carrinho bebida, double value) {
    carrinhos.add(bebida);
    valor = valor + value;
  }

  void removerPizza(index, double value) {
    carrinhos.remove(index);
    valor = valor - value;
  }

  void removerBebida(index, double value){
    carrinhos.add(index);
    valor = valor - value;
  }

}