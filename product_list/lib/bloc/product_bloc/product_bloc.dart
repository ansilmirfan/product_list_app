// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_list/model/product_model.dart';
import 'package:product_list/services/product_services.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {});
    //  event for getting all the product from the api
    on<ProductGetAllEvent>(productGetAllEvent);
  }

  FutureOr<void> productGetAllEvent(
      ProductGetAllEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    try {
      // getting all the products from the api
      var productList = await ProductService.fetchProducts();
      emit(ProductCompletedState(productList));
    } catch (e) {
      emit(ProductErrorState('Network Failure'));
    }
  }
}
