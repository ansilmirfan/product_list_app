import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_list/model/cart_model.dart';
import 'package:product_list/model/product_model.dart';
import 'package:product_list/services/cart_services.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {});
    //event for getting all the cart item
    on<CartGetAllEvent>(cartGetAllEvent);
    //event for addingproduct to the cart
    on<AddToCartEvent>(addToCartEvent);
  }

  FutureOr<void> cartGetAllEvent(
      CartGetAllEvent event, Emitter<CartState> emit) {
    emit(CartLoadingState());
    var cart = CartServices.cart;
    emit(CartCompletedState(cart,CartServices.getTotalPrice()));
  }

  FutureOr<void> addToCartEvent(AddToCartEvent event, Emitter<CartState> emit) {
    emit(CartLoadingState());
    //if the add to cart returns true then success otherwise the item is already in the cart so it will increase the quantity
    CartServices.addToCart(event.productModel);
    add(CartGetAllEvent());
  }
}
