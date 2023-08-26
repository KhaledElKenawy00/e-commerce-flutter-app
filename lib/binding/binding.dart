import 'package:eccommerce/controller/auth_controller.dart';
import 'package:eccommerce/controller/cart_controlller.dart';
import 'package:eccommerce/controller/home_controller.dart';
import 'package:eccommerce/controller/home_page_controller.dart';
import 'package:eccommerce/controller/product_cart_controller.dart';



import 'package:get/get.dart';

class Binding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => CartControlller());
    Get.lazyPut(() => ProductController());

   
   
  }


}