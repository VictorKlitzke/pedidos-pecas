import 'package:flutter/material.dart';

class PadraoButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color backgroundColor;

  PadraoButton({required this.text, 
    required this.onPressed, 
    required this.textColor, 
    required this.backgroundColor, 
    super.key});

  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18)
        ),
      ),
    );
  }
}