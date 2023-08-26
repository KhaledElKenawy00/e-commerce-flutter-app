import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccommerce/models/user_model.dart';

class FireStoreUser
{
UserModel userModel=UserModel();
   CollectionReference _users = FirebaseFirestore.instance.collection('users');

Future<void> addUser(  final UserModel) async{
  return  await _users
    .doc(UserModel.userid)
    .set(UserModel.toJson())
    .then((value) => print("User Added"))
    .catchError((error) => print("Failed to add user: $error"));
}
}