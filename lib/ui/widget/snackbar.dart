import 'package:flutter/material.dart';

class Snackbar {
  BuildContext context;
  String text;

  Snackbar(this.context, this.text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}