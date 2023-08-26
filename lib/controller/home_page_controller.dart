import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccommerce/models/categorey_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class HomePageController extends GetxController
{

ValueNotifier<bool>_loading=ValueNotifier(false);
get loading=>_loading;
List<CategoreyModel> categoreyModel =[];
 HomePageController()
 {
  getCategorey();
  getBestSailing();
  

 }
var _firebaseAuth=FirebaseFirestore.instance.collection('categorey');
var _productref =FirebaseFirestore.instance.collection('products');

List<ProductModel> productlist=[];


getCategorey() async
{
  _loading.value=true;

 await _firebaseAuth.get().then((value)
{
  for (int i = 0; i < value.docs.length; i++) {
    categoreyModel.add(CategoreyModel.fromJson(value.docs[i].data()));
    _loading.value=false;

    
  }
  update();


});


}
getBestSailing() async
{
  _loading.value=true;

 await _productref.get().then((value)
{
  for (int i = 0; i < value.docs.length; i++) {
    productlist.add(ProductModel.fromJson(value.docs[i].data()));
    _loading.value=false;

    
  }
  update();


});


}
}