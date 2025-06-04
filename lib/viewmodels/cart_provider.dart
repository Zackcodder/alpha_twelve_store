import 'package:flutter/material.dart';

class CartViewModel with ChangeNotifier {
  final Map<String, int> _cart = {}; // productId -> quantity

  Map<String, int> get cart => _cart;

  void addToCart(String productId) {
    _cart.update(productId, (qty) => qty + 1, ifAbsent: () => 1);
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _cart.remove(productId);
    notifyListeners();
  }

  void incrementQuantity(String productId) {
    _cart[productId] = (_cart[productId] ?? 0) + 1;
    notifyListeners();
  }

  void decrementQuantity(String productId) {
    if (_cart.containsKey(productId)) {
      if (_cart[productId]! > 1) {
        _cart[productId] = _cart[productId]! - 1;
      } else {
        _cart.remove(productId);
      }
      notifyListeners();
    }
  }

  int get totalItems =>
      _cart.values.fold(0, (previous, current) => previous + current);
}
