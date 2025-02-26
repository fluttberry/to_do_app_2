import 'package:flutter/material.dart';

class Snackbar {
  BuildContext context;

  String text;

  SnackBar(this.context, this.text){
    ScaffoldMessenger.of(context).showSnackBar(Snackbar(context: Text(text)));
  }
}