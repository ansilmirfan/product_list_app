import 'package:product_list/model/cart_model.dart';
import 'package:product_list/model/product_model.dart';

class CartServices {
  static List<CartModel> cart = [];

  // Adding product to the cart
  static void addToCart(ProductModel product) {
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
    // if product is not in the cart
    if (!isProductInCart) {
      cart.add(CartModel(product: product));
    }
  }

  // Get total price of the cart
  static double getTotalPrice() {
    double total = 0.0;
    for (var item in cart) {
      total += item.getTotalPrice();
    }
    return total;
  }

  //removing product from the cart
  static void removeProduct(CartModel product) {
    for (var item in cart) {
      if (item == product) {
        cart.remove(item);
        break;
      }
    }
  }
}
