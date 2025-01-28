import 'package:product_list/model/product_model.dart';

class CartModel {
  final ProductModel product;
  int quantity;

  CartModel({required this.product, this.quantity = 1});

  // Incresing the quantity
  void increaseQuantity() {
    quantity++;
  }

  // Decreasing the quantity
  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  // getting total price
  double getTotalPrice() {
    return product.price! * quantity;
  }
}
