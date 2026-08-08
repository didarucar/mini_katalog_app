import '../models/product_model.dart';

class CartService {
  // Singleton pattern ile sepetin her sayfada aynı kalmasını sağlıyoruz
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<ProductModel> _cartItems = [];

  List<ProductModel> get cartItems => _cartItems;

  void addProduct(ProductModel product) {
    _cartItems.add(product);
  }

  void removeProduct(ProductModel product) {
    _cartItems.remove(product);
  }
}