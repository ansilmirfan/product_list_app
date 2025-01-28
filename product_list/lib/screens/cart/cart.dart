import 'package:flutter/material.dart';
import 'package:product_list/widget/custom_appbar.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Cart'),
    );
  }
}
