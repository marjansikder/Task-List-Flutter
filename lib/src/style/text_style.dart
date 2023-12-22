import 'package:flutter/material.dart';
import 'package:task_list/src/style/colors.dart';


String FONT_NAME = 'Hind Siliguri';
String FONT_NAME2 = 'arial';
String FONT_NAME3 = 'Rubik';


var cLargeLabelTextStyle =
TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0, color: Colors.white);

TextStyle getTextStyleDisplay(double sized,FontWeight weight,Color color){
  return TextStyle(
    fontFamily: FONT_NAME,
    fontSize: sized,
    fontWeight: weight == false?FontWeight.normal:weight,
    color: color == false?Colors.black:color,
  );
}
TextStyle getTextStyleAsap(double sized,FontWeight weight,Color color){
  return TextStyle(
    fontFamily: FONT_NAME,
    fontSize: sized,
    fontWeight: weight == false?FontWeight.normal:weight,
    color: color == false?Colors.black:color,
  );
}


TextStyle getTextStyle(double sized,FontWeight? weight,Color? color){
  return TextStyle(
    fontFamily: FONT_NAME,
    fontSize: sized,
    fontWeight: weight == null?FontWeight.normal:weight,
    color: color == null? AppColors.textColorBlack:color,
    height: 1.1
  );
}
TextStyle getArialTextStyle(double sized,FontWeight? weight,Color? color){
  return TextStyle(
      fontFamily: FONT_NAME,
      fontSize: sized,
      fontWeight: weight == null?FontWeight.normal:weight,
      color: color == null?Colors.black:color,
      height: 1.1
  );
}

