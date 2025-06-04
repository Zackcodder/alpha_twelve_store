import 'package:flutter/material.dart';

import '../core/models/products_model.dart';
import '../data/product_data.dart';

class ProductViewModel with ChangeNotifier {
  final List<Product> _products = mockProducts;

  List<Product> get products => _products;

  Product getProductById(String id) =>
      _products.firstWhere((product) => product.id == id);
}
