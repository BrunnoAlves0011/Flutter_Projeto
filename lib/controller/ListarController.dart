import 'package:cloud_firestore/cloud_firestore.dart';

class ListarController{
  final FirebaseFirestore db = FirebaseFirestore.instance;


  Stream<QuerySnapshot> bebidalist(){
    var resultado = db.collection('Bebidas');
    return resultado.snapshots();
  }
    Stream<QuerySnapshot> docelist(){
    var resultado = db.collection('PizzaDoce');
    return resultado.snapshots();
  }
    Stream<QuerySnapshot> sallist(){
    var resultado = db.collection('PizzaSal');
    return resultado.snapshots();
  }
}