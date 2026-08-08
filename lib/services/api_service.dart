import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://wantapi.com/products.php"),
    );

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(utf8.decode(response.bodyBytes));

      List<dynamic> productList = [];

      if (decodedData is Map && decodedData.containsKey('data')) {
        productList = decodedData['data'];
      } else if (decodedData is List) {
        productList = decodedData;
      } else if (decodedData is Map && decodedData.containsKey('products')) {
        productList = decodedData['products'];
      } else if (decodedData is Map) {
        productList = [decodedData];
      }

      return productList
          .map((item) => ProductModel.fromJson(item))
          .toList();
    } else {
      throw Exception("Ürünler yüklenemedi! Kod: ${response.statusCode}");
    }
  }
}