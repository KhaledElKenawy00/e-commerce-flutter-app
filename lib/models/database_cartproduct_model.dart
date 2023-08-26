import 'package:cloud_firestore/cloud_firestore.dart';

class CartProductModel
{

 String ?name;
 String ?image;
 String ?price;
 int ?quantity;

  CartProductModel({required this.name,required this.image,required this.price,required this.quantity});


static CartProductModel fromSnapshot(DocumentSnapshot snap) {
    CartProductModel product = CartProductModel(
      name: snap['name'],
      price: snap['price'],
      image: snap['image'],
      quantity: snap['quantity']
    );
    return product;
  }


}