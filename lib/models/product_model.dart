import 'package:eccommerce/helper/hexdisimal_color.dart';
import 'package:flutter/material.dart';

class ProductModel 
{
 String image;
 String description;
 String price;
 Color color;
String name;

  ProductModel({required this.image, required this.description, required this.price, required this.color, required this.name});

  factory ProductModel.fromJson(Map <dynamic,dynamic> map)
  {
return ProductModel(image:map ['image'] ,description:map ['description'],  price:map ['price'], color:HexColor.fromHex(map['color']), name:map ['name']);


  }



}