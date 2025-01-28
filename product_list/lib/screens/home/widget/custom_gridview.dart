import 'package:flutter/material.dart';
import 'package:product_list/model/product_model.dart';
import 'package:product_list/screens/home/widget/product_card.dart';

class CustomGridview extends StatelessWidget {
  final List<ProductModel> products;
  const CustomGridview({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductCard(product: products[index]),
    );
  }
}
