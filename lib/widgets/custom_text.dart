import 'package:flutter/material.dart';

class customText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final Alignment alignment;

  const customText({
    this.alignment=Alignment.topLeft,
   
     this.text='',
     this.color=Colors.black,
    this.fontWeight=FontWeight.bold,
     this.fontSize=30,
  }) ;




  
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: alignment,
      child: Text(text,style: TextStyle(
                  color:color,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  
                  
                  
                ),
              
                ),
    );
  }
}
