import 'package:flutter/material.dart';
import 'package:product_list/widget/custom_appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Home'),
    );
  }
}
