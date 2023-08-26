import 'package:eccommerce/models/user_model.dart';
import 'package:eccommerce/services/firestore_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view/Home/home_page.dart';

class AuthController extends GetxController
{




   
final GoogleSignIn _googleSignIn=GoogleSignIn(scopes: ['email']);
final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
TextEditingController email=TextEditingController();
TextEditingController password=TextEditingController();
TextEditingController name=TextEditingController();
//we create a varible of type user the user type return RXn 
// then we get the value of user varible because it is private 
//we must use func oninit to can use func bind stream 
//bind stream bring the changes occure on firebaseauth 
 Rxn<User>_user = Rxn<User>();
 String? get user=>_user.value?.email;
 @override
  void onInit() {
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
    
  }

 
       


Future<UserCredential?> signInWithGoogle()  async {
  // Trigger the authentication flow
  var googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential).then((user) async{

await FireStoreUser().addUser( UserModel(
              name: (name.text==null)? user.user!.displayName :name.text,
              userid: user.user!.uid,
              email: user.user!.email,
              picure: ''

  ));
  
  Get.offAll(HomePage());
           


  });;
}

signInWithEmailPassword() async
{
  
try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email:email.text.trim(),
    password:password.text.trim()
  );
  Get.offAll(HomePage());
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
   SnackBar(content: Text('No user found for that email',style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: Colors.black,
   ),),
   backgroundColor: Colors.blueAccent,
   );
  } else if (e.code == 'wrong-password') {
    SnackBar(content: Text('wrong password',style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: Colors.black,
   ),));
  }
}
}
createEmail() async 
{
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email.text.trim(),
    password: password.text.trim(),
  ).then((user) async{

await FireStoreUser().addUser( UserModel(
              name: name.text,
              userid: user.user!.uid,
              email: user.user!.email,
              picure: ''

  ));
  
  Get.offAll(HomePage());
           


  });
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
}

}