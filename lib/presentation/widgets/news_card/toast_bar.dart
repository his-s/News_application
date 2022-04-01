import 'package:flutter/material.dart';

class ToastBar extends SnackBar {
  final String text;
  ToastBar({required this.text})
      : super(
          content: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 70,
          ),
          padding: const EdgeInsets.all(17),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.grey.shade300,
          duration: const Duration(
            milliseconds: 500,
          ),
        );
}
