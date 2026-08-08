import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/cart_service.dart';
import '../services/theme_service.dart'; 

class DetailScreen extends StatelessWidget {
  final ProductModel product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    
    final bool isDarkMode = ThemeService().isDarkMode;
    final bgColor = isDarkMode ? Colors.grey.shade900 : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final cardColor = isDarkMode ? Colors.grey.shade800 : Colors.grey.shade100;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          product.name,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    product.image,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 250,
                        color: cardColor,
                        child: const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),

              
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 4),

              // Fiyat Bilgisi
              Text(
                "${product.price} ${product.currency}",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              // Açıklama Başlığı
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),

              
              Text(
                product.description.isNotEmpty ? product.description : "Açıklama bulunmuyor.",
                style: TextStyle(
                  color: isDarkMode ? Colors.grey.shade300 : Colors.grey,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),

              
              Text(
                "Specifications",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 12),

              
              if (product.specs != null) ...[
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (product.specs?.chip != null) _buildSpecItem("Chip", product.specs!.chip!, cardColor, textColor),
                    if (product.specs?.material != null) _buildSpecItem("Material", product.specs!.material!, cardColor, textColor),
                    if (product.specs?.camera != null) _buildSpecItem("Camera", product.specs!.camera!, cardColor, textColor),
                    if (product.specs?.display != null) _buildSpecItem("Display", product.specs!.display!, cardColor, textColor),
                    if (product.specs?.battery != null) _buildSpecItem("Battery", product.specs!.battery!, cardColor, textColor),
                    if (product.specs?.size != null) _buildSpecItem("Size", product.specs!.size!, cardColor, textColor),
                    if (product.specs?.colors != null) _buildSpecItem("Colors", product.specs!.colors!, cardColor, textColor),
                  ],
                ),
              ] else ...[
                const Text(
                  "Teknik özellik bulunmuyor",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
              const SizedBox(height: 40),

              
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkMode ? Colors.white : Colors.black,
                    foregroundColor: isDarkMode ? Colors.black : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    CartService().addProduct(product);
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Ürün sepete eklendi!"),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  Widget _buildSpecItem(String title, String value, Color cardColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 11),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: textColor),
          ),
        ],
      ),
    );
  }
}