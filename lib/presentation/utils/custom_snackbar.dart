import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showSnackBar(BuildContext context, String event) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black,
        elevation: 700,
        duration: const Duration(milliseconds: 600),
        content: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(width: 1.0, color: Colors.white),
          ),
          // margin: EdgeInsets.fromLTRB(0, 0, 0, MediaQuery.of(context).size.height * 0.75),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              event,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600,),
            ),
          ),
        ),
      ),
    );
  }
}
