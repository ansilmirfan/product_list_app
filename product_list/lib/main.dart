import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/bloc/product_bloc/product_bloc.dart';
import 'package:product_list/screens/bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc()..add(ProductGetAllEvent()),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNav(),
      ),
    );
  }
}
