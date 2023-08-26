import 'package:eccommerce/controller/auth_controller.dart';
import 'package:eccommerce/view/auth/logain_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_bottom.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field_form.dart';
import 'constans.dart';

class SignUpPage extends GetWidget<AuthController> {


  GlobalKey<FormState> _formstate=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.off(LoginPage());
        }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:30.0,right: 20,left: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formstate,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                      text: 'Sign Up,',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    
                    
                  ],
                  
                ),
               
                SizedBox(height: 40,),
                 customText(
                  text: 'Name',
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  
                ),
          
              customTextField(hintText: 'khaled', obscureText: false, 
              controller: controller.name,
             
              onSaved: (value){
                controller.name=value;
              }, validator: (value){
                if (value) {
                  
                }
              }
              , textInputType:TextInputType.emailAddress),
              SizedBox(height: 30,),
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
                 
              SizedBox(height: 10,),
              customBottom(onTap: (){
               
                _formstate.currentState?.save();
                if (_formstate.currentState!.validate()) {
                  controller.createEmail();
                  
                }
              }, text: 'SIGN UP',),
              
             
          
          
              
                 
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}