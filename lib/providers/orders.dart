import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:state_management_studies/providers/cart.dart';

class Order {
  final String id;
  final double totalAmount;
  final List<CartItem> products;
  final DateTime date;

  Order({
    required this.id,
    required this.totalAmount,
    required this.products,
    required this.date,
  });
}

class Orders with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(List<CartItem> products, double total) {
    _items.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        totalAmount: total,
        date: DateTime.now(),
        products: products,
      ),
    );

    notifyListeners();
  }
}
