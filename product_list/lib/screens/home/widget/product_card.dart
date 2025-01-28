import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/bloc/cart_bloc/cart_bloc.dart';
import 'package:product_list/model/product_model.dart';
import 'package:product_list/screens/productview/productview.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              product: product,
            ),
          ));
        },
        child: Stack(
          children: [
            _productDetails(),
            _addToCart(context),
          ],
        ),
      ),
    );
  }

  Align _addToCart(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton.filled(
        onPressed: () {
          context.read<CartBloc>().add(AddToCartEvent(product));
        },
        icon: const Icon(Icons.add_shopping_cart_outlined),
      ),
    );
  }

  Column _productDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product image
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.network(
              product.image!,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Product title and price
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product title
              Text(
                product.title!,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              // Product price
              Text(
                "\$${product.price}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
