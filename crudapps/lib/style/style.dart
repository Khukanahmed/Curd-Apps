import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorWhite = Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue = Color.fromRGBO(44, 62, 80, 1);

InputDecoration AppInput(level) {
  return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.green, width: 1),
      ),
      fillColor: Colors.white,
      filled: true,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0)),
      border: OutlineInputBorder(),
      labelText: level);
}

DecoratedBox AppDropDownStyle(child) {
  return DecoratedBox(
    decoration: BoxDecoration(
        color: colorWhite,
        border: Border.all(color: colorWhite, width: 1),
        borderRadius: BorderRadius.circular(4)),
    child: Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: child,
    ),
  );
}

void errorMassage(mag) {
  Fluttertoast.showToast(
      msg: mag,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void successMassage(mag) {
  Fluttertoast.showToast(
      msg: mag,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM_LEFT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

SliverGridDelegateWithFixedCrossAxisCount ProductgridViwe() {
  return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, 
      mainAxisExtent: 250, 
      mainAxisSpacing: 2);
}
