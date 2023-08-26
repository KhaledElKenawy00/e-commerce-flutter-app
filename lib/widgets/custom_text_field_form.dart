import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Function onSaved;
  final Function validator;
  final TextInputType textInputType;
final  TextEditingController  controller;

  const customTextField({
   required this.controller,
    required this.hintText,
    required this.obscureText,
    
     required this.onSaved,
     required this.validator,
   required  this.textInputType,
  }) ;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
              keyboardType: textInputType,
             
              obscureText: obscureText,
              decoration: InputDecoration(
             
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                )
              ),
            );
  }
}
