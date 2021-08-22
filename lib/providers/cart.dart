import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:state_management_studies/providers/product.dart';

class CartItem {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.productId,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get item {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(product.id, (existingItem) {
        return CartItem(
          id: existingItem.id,
          productId: product.id,
          title: existingItem.title,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
        );
      });
    }
    _items.putIfAbsent(
        product.id,
        () => CartItem(
              id: Random().nextDouble().toString(),
              productId: product.id,
              title: product.title,
              quantity: 1,
              price: product.price,
            ));

    notifyListeners();
  }

  void removeItem(String producId) {
    _items.remove(producId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
