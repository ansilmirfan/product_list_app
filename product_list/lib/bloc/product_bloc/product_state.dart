// ignore_for_file: must_be_immutable

part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductErrorState extends ProductState {
  String message;
  ProductErrorState(this.message);
}

class ProductCompletedState extends ProductState {
  List<ProductModel> products;
  ProductCompletedState(this.products);
}
