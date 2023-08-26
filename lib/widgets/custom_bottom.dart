import 'package:flutter/material.dart';

import '../view/auth/constans.dart';
import 'custom_text.dart';

class customBottom extends StatelessWidget {
 final VoidCallback onTap;
 final String text;
  const customBottom({
    
    required this.onTap,
    required this.text,
  }) ;



  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: onTap,
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimariyColor,
                borderRadius: BorderRadius.circular(10),
                
              ),
              child:customText(
                text: text,
                fontSize: 18,
                color: Colors.white,
                alignment: Alignment.center,
              ),
            ),
          );
  }
}
