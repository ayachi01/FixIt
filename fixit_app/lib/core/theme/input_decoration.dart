import 'package:flutter/material.dart';

InputDecoration inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color(0XFFB0B0B0),
      ),

      // Border
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),

      // Enabled Border
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0XFFB0B0B0),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),

      // Focused Border
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0XFF000000),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),

      // Error Border
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0XFFDC3545),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
