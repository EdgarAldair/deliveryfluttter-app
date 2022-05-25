import 'package:flutter/material.dart';

class MySnackbar {
  static void show(BuildContext context, String text) {
    // ignore: unnecessary_null_comparison
    if (context == null) return;
    // ignore: unnecessary_new
    FocusScope.of(context).requestFocus(new FocusNode());

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    // ignore: unnecessary_new
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        // ignore: prefer_const_constructors
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 3),
    ));
  }
}
