import 'package:eccommerce/models/database_cartproduct_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../services/database/firesore_db.dart';

class ProductController extends GetxController {
  // Add a list of Product objects.
  final products = <CartProductModel>[].obs;

  @override
  void onInit() {
    products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}