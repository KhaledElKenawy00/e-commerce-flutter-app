import 'package:eccommerce/controller/auth_controller.dart';
import 'package:eccommerce/view/auth/logain_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/auth/constans.dart';
import 'home_controller.dart';

class ControllView extends GetWidget<AuthController> {
 
  //on view controller we must return obx 
  //obx return func (){inside func we must return the changes occure on_user about get.find<datatype>().user }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user ==null) ? LoginPage():
      Scaffold(
        bottomNavigationBar: bottomNavigationBar(),

        body:GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) => controller.currentPage,
        ));

    });
  }
   Widget bottomNavigationBar()
  {
    return GetBuilder<HomeController>(
      init: HomeController(),
    builder:(controller) =>  BottomNavigationBar(
      
       
       currentIndex: controller.currentIndex,
        onTap: (value) {
          controller.selectedPage(value);
          
        },
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore),activeIcon:Text('Explore',style: TextStyle(color:kPrimariyColor),),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel),activeIcon:Text('Cart',style: TextStyle(color:kPrimariyColor)),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person),activeIcon:Text('Profile',style: TextStyle(color:kPrimariyColor)),label: '')
        ]
        ),
    );


  }
}