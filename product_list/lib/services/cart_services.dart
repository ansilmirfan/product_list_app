import 'package:product_list/model/cart_model.dart';
import 'package:product_list/model/product_model.dart';

class CartServices {
  List<CartModel> cart = [];

  // Adding product to the cart
  void addToCart(ProductModel product) {
    // Checking for duplication
    bool isProductInCart = false;
    for (var item in cart) {
      // if product is in the cart then adding quantity
      if (item.product == product) {
        item.increaseQuantity();
        isProductInCart = true;
        break;
      }
    }
    // if product is not in the cart then adding to the cart list
    if (!isProductInCart) {
      cart.add(CartModel(product: product));
    }
  }

  //getting total price of the cart
  double getTotalPrice() {
    double total = 0.0;
    for (var item in cart) {
      total += item.getTotalPrice();
    }
    return total;
  }
}
