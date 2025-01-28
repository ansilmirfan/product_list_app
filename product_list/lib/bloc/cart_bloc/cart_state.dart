// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoadingState extends CartState {}

final class CartErrorState extends CartState {}

final class CartCompletedState extends CartState {
  double total;
  List<CartModel> cart;
  CartCompletedState(this.cart, this.total);
}
