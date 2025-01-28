import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/bloc/cart_bloc/cart_bloc.dart';

import 'package:product_list/widget/custom_appbar.dart';
import 'package:product_list/widget/error_message.dart';
import 'package:product_list/widget/loading.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Cart"),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadingState) {
              return const Loading();
            } else if (state is CartCompletedState) {
              if (state.cart.isEmpty) {
                return const ErrorMessage(message: 'Cart is empty');
              } else {
                _listView(state);
              }
            }
            return const SizedBox.shrink();
          },
        ));
  }

  Column _listView(CartCompletedState state) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: state.cart.length,
            itemBuilder: (context, index) {
              final cartItem = state.cart[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: Image.network(
                    cartItem.product.image!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    cartItem.product.title!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Quantity: ${cartItem.quantity}\nPrice: \$${cartItem.getTotalPrice().toStringAsFixed(2)}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_shopping_cart),
                    onPressed: () {},
                  ),
                ),
              );
            },
          ),
        ),
        // Total Amount
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Amount',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${state.total}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
