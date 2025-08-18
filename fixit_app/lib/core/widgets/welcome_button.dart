import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;

  const WelcomeButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
  });

  // Background color
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? const Color(0XFF386641) : Colors.white,
        foregroundColor: isPrimary ? Colors.white : const Color(0XFF386641),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),

        // Rounded Corner
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: isPrimary
              ? BorderSide.none
              : const BorderSide(color: Color(0xFF386641), width: 2),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: isPrimary ? Colors.white : const Color(0xFF386641),
        ),
      ),
    );
  }
}
