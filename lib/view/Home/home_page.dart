
import 'package:eccommerce/controller/home_page_controller.dart';
import 'package:eccommerce/view/Home/details_product.dart';
import 'package:eccommerce/view/auth/constans.dart';
import 'package:eccommerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart.dart';

class HomePage extends GetWidget<HomePageController>{

List <String>title=['BeoPlay Speaker','Leather Wristwatch',];
List <String>subTitle=['Bang and Olufsen','Tag Heuer',];
List <String>prices=['150\$','500\$'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder:(controller) =>(controller.loading.value)? Center(child: CircularProgressIndicator(
        color: kPrimariyColor,
        
      )) :   Scaffold(
        
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top:50.0,left: 20,right: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50)
                ),
                child: TextFormField(
                  
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                    )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              customText(
                text: 'Categories',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
    
               SizedBox(height: 20,),
    
               Container(
                height: 100,
                 child: Column(
                   children: [
                     Expanded(
                               
                       child:ListView.separated(
                        
                       
                        scrollDirection:Axis.horizontal,
                                  
                        itemBuilder:(context, index,){
                        
                         return Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(50),
                                  
                            ),
                            child: Image.network(controller.categoreyModel[index].image,height: 55,width: 55,),
                          ),
                          SizedBox(height: 20,),
                          customText(
                            text:controller.categoreyModel[index].name,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            alignment: Alignment.center,
                          )
                          
                        ],
                       );
                                  
                       }, separatorBuilder: ((context, index)=>SizedBox(width: 20,)
                         
                       ), itemCount:controller.categoreyModel.length),
                     ),
                   ],
                 ),
               ),
               SizedBox(height:20,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(
                    text: 'Best Selling',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                   customText(
                    text: 'See all',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )
                ],
               ),
               SizedBox(height: 20,),
                
               
              
                 Expanded(
                   child: ListView.separated(
                    scrollDirection:Axis.horizontal,
                                
                    itemBuilder:(context, index,){
                    
                     return GestureDetector(
                      onTap: (){
                        Get.to(DetailsProduct(model: controller.productlist[index], index: index,));
                      },
                       child: Column(
                                         children: [
                        Container(
                          height:200,
                          width:  MediaQuery.of(context).size.width*0.5,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(30),
                                  
                          ),
                          child: Image.network(controller.productlist[index].image,height:250,width: 250,),
                        ),
                        SizedBox(height: 20,),
                        customText(
                          text:controller.productlist[index].name,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          alignment: Alignment.center,
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          child: customText(
                            text:controller.productlist[index].description.substring(0,10),
                           
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            alignment: Alignment.center,
                          ),
                        ),
                        SizedBox(height: 10,),
                        customText(
                          text:controller.productlist[index].price,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          alignment: Alignment.center,
                          color: kPrimariyColor,
                        )
                        
                                         ],
                                        ),
                     );
                                
                   }, separatorBuilder: ((context, index)=>SizedBox(width: 20,)
                     
                   ), itemCount:controller.productlist.length),
                 ),
               
             
              
    
               
    
            ],
          ),
        )
        
      ),
    );
  }

 
}