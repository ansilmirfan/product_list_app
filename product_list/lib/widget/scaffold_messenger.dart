import 'package:flutter/material.dart';

void showProductAddedMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content:  Text(
        'Product added to cart!',
        style: TextStyle(fontSize: 16),
      ),
      backgroundColor: Colors.green,
      duration:  Duration(seconds: 2),
    ),
  );
}
