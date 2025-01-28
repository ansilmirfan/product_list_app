import 'package:flutter/material.dart';
import 'package:product_list/bloc/cart_bloc/cart_bloc.dart';
import 'package:product_list/bloc/product_bloc/product_bloc.dart';
import 'package:product_list/screens/home/widget/custom_gridview.dart';

import 'package:product_list/widget/custom_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/widget/error_message.dart';
import 'package:product_list/widget/loading.dart';
import 'package:product_list/widget/scaffold_messenger.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Home'),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartProductAddedState) {
            showProductAddedMessage(context);
          }
        },
        builder: (context, state) {
          return BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoadingState) {
                return const Loading();
              } else if (state is ProductCompletedState) {
                return CustomGridview(products: state.products);
              } else if (state is ProductErrorState) {
                return ErrorMessage(message: state.message);
              } else {
                return const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
