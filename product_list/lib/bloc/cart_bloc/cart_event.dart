// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class AddToCartEvent extends CartEvent {
  ProductModel productModel;
  AddToCartEvent(this.productModel);
}

final class CartGetAllEvent extends CartEvent {}

final class CartRemoveEvent extends CartEvent {
  CartModel cartModel;
  CartRemoveEvent(this.cartModel);
}
