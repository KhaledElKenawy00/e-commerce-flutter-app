import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccommerce/view/Home/cart.dart';
import 'package:eccommerce/view/Home/home_page.dart';
import 'package:eccommerce/view/Home/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{

  
int _currentIndex=0;
get currentIndex=>_currentIndex;
Widget _currentPage=HomePage();
get currentPage=>_currentPage;


selectedPage(value)
{
  
  _currentIndex=value;
  update();
  switch (value) {
    case 0:
    {
      _currentPage=HomePage();
      break;
    }
    case 1:
    {
      _currentPage=Cart();
      break;
    }
    case 2:
    {
      _currentPage=Profile();
      break;
    }
     
    
  }
}




}