
import 'package:eccommerce/view/auth/constans.dart';
import 'package:eccommerce/view/auth/signup_page.dart';
import 'package:eccommerce/widgets/custom_bottom.dart';
import 'package:eccommerce/widgets/custom_text.dart';
import 'package:eccommerce/widgets/custom_text_field_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';


class LoginPage extends GetWidget<AuthController> {
GlobalKey<FormState> _formstate=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:30.0,right: 20,left: 20),
        child: Form(
          key: _formstate,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(
                    text: 'Welcome,',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignUpPage());
                      },
                      child: customText(
                      text: 'Sign',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kPrimariyColor,
                                      ),
                    )
                  
                ],
                
              ),
              customText(
                text: 'Sign in to Continue',
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.normal,
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 40,),
               customText(
                text: 'Email',
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                
              ),
        
            customTextField(hintText: 'elpro766@gmail.com', obscureText: false, 
            controller: controller.email,
            onSaved: (value){
              controller.email=value;
            }, validator: (value){
              if (value) {
                
              }
            }
            , textInputType:TextInputType.emailAddress)
             , SizedBox(height:30,),
               customText(
                text: 'Password',
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                
              ),
             customTextField(hintText: '**********', obscureText: true,
             controller: controller.password,
              onSaved: (value){
                controller.password=value;
              },
               validator: (){}, 
              textInputType:TextInputType.visiblePassword)
             , SizedBox(height: 10,),
                customText(
                text: 'Forgot Password?',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                alignment: Alignment.topRight,
                
              ),
            SizedBox(height: 10,),
            customBottom(onTap: (){
             
              _formstate.currentState?.save();
              if (_formstate.currentState!.validate()) {
                controller.signInWithEmailPassword();
                
              }
            }, text: 'SIGN IN',),
            SizedBox(height: 10,),
            customText(
              text: '-OR-',
              fontSize: 22,
              fontWeight: FontWeight.w500,
              alignment: Alignment.center,
              color: Colors.grey,
            ),
            SizedBox(height: 10,),
        
        
        
             InkWell(
            onTap: (){
             
            },
            child: Row(
              
              children: [
                Image.asset('lib/assets/Facebook_Logo_(2019).png',height: 30,width: 30,),
                SizedBox(width: 80,),
                customText(
                  text: 'Sign in with Facebook',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ),
          SizedBox(height: 40,),
        
        
          InkWell(
            onTap: (){
             
                controller.signInWithGoogle();
          
            },
            child: Row(
              
              children: [
                Image.asset('lib/assets/Google__G__Logo.svg.png',height: 30,width: 30,),
                SizedBox(width: 80,),
                customText(
                  text: 'Sign in with Google',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )
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