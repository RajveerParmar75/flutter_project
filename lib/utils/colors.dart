import 'package:flutter/material.dart';

const buttonColor = Color.fromRGBO(240, 51, 74, 1);

const kSecondaryBackgroundColor = Color.fromRGBO(107, 82, 200, 0.1);
const kPrimaryBackgroundColor =Colors.deepOrange;
double currentWidth(context ,int value){
  return (MediaQuery.of(context).size.width*value)/100;
}
double currentHeight(context ,int value){
  return (MediaQuery.of(context).size.height*value)/100;
}