import 'package:flutter/material.dart';

class TextFormFieldItems{
  static  InputDecoration items({required String text,IconData? prefIcon,IconData? sufIcon}){
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      prefixIcon:  Icon(prefIcon),
      suffixIcon: Icon(sufIcon),
      hintText: text,
      fillColor: Colors.white,
      filled: true,
    );
  }
}