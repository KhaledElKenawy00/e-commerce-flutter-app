
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:eccommerce/models/database_cartproduct_model.dart';
import 'package:eccommerce/models/product_model.dart';
import 'package:eccommerce/view/auth/constans.dart';
import 'package:eccommerce/widgets/custom_bottom.dart';
import 'package:eccommerce/widgets/custom_text.dart';

import '../../controller/cart_controlller.dart';
import '../../controller/product_cart_controller.dart';

class Cart extends GetWidget<CartControlller> {
  final CartControlller cartControlller=Get.find();
  
  @override
  Widget build(BuildContext context) {
    return  Obx(
      
      () => Scaffold(
          backgroundColor: Colors.white,
      
          body: Padding(
            padding: const EdgeInsets.only(top:40.0,left: 10,right: 10,),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child:ListView.separated(itemBuilder: (context, index){
                      return CartProduct(controller: controller, product:controller.products.keys.toList()[index], index: index, quantity: controller.products.values.toList()[index]);
                      
                    }, separatorBuilder: (BuildContext context, int index){
                       return SizedBox(height:10,);
                    }, itemCount:controller.products.length)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
                  child: Row(
                   
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                    Column(
                     
                      children: [
                          Padding(
                            padding: const EdgeInsets.only(right:10.0),
                            child: customText(
                                              text: 'Total',
                                              fontSize: 14,
                                              fontWeight:FontWeight.w200,
                                            ),
                          ),
                        customText(
                        text: '600',
                        fontSize: 18,
                        color: kPrimariyColor,
                        fontWeight:FontWeight.normal,
                      ),
                      ],
                    ),
                    MaterialButton(
                      height: 50,
                      color: kPrimariyColor,
                      onPressed: (){},child: Text('CHECKOUT',
                    style: TextStyle(
                      color: Colors.white
                
                    ),),)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );
    
  }
}

class CartProduct extends StatelessWidget {


 final CartControlller controller;
  final CartProductModel product;
  final int index;
  final int quantity;

  const CartProduct({ required this.controller, required this.product, required this.index, required this.quantity});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Row(
        
        children: [
          Image.network(product.image as String),
          Padding(
            padding: const EdgeInsets.only(left:60.0),
            child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  text: product.name as String,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                
                ),
                SizedBox(height: 6,),
                customText(
                  text:product.price as String,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: kPrimariyColor,
                
                ),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  color: Colors.grey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.add))
                
                     , customText(
                      text: '1',
                      alignment:Alignment.center,
                      fontSize: 18,
                
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom:10.0),
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.minimize)),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
        
      ),
    
    );
  }
}


class DetailsProduct extends StatelessWidget {
  
   ProductModel model;
  
 final cartController = Get.put(CartControlller());
  final ProductController productController = Get.find();
     int index;
 DetailsProduct({
  
   
    required this.model,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Details(model: model, cartController: cartController, productController: productController, index: index);
  }
}

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.model,
    required this.cartController,
    required this.productController,
    required this.index,
  });

  final ProductModel model;
  final CartControlller cartController;
  final ProductController productController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        actions: [
          Row(
            children: [
             
              IconButton(onPressed: (){}, icon: Icon(Icons.star)),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey
                ),
                width:double.infinity,
                height: 240,
                child: Image.network(model.image,)),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: Row(
                    children: [
                      customText(
                        text: model.name,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 130,),
                      
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Container(
                    height: 50,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey
                    ) ,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                        text: 'color:',
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(width: 15,),
                      Container(
                        height: 25,
                        width: 25,
                        color: model.color,
                      )
                        ],
                      ),
                    )
                  ),
                ),
                    ],
                  ),
                  
                ),
              

                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: customText(
                    text: 'Description',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: customText(
                    text: model.description,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: 'Price',
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                      
                          ),
                           customText(
                            text: model.price,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: kPrimariyColor,
                      
                          )
                        ],
                      ),
                       MaterialButton(onPressed: (){
                         cartController.addProduct(CartProductModel(name: model.name, image:model.image, price: model.price, quantity:1));
                        },
                        color: kPrimariyColor,
                        child: Text('Add',style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                        ),),
                        ),
                      
                    ],
                  ),
                )

            ],
          ),
        ),
      ),
    );
  }
}