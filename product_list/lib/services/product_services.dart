import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:product_list/model/product_model.dart';

class ProductService {
  static Future<List<ProductModel>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      // If the server returns status code 200 the success otherwise failure
      List<dynamic> productList = json.decode(response.body);
      return productList
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
