import 'package:flutter/material.dart';

class CarritoItem {
  final String id;
  final String titulo;
  final double precio;
  int cantidad;

  CarritoItem({
    required this.id,
    required this.titulo,
    required this.precio,
    this.cantidad = 1,
  });
}

class Carrito with ChangeNotifier {
  Map<String, CarritoItem> _items = {};

  Map<String, CarritoItem> get items => _items;

  int get itemCount => _items.length;

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, item) {
      total += item.precio * item.cantidad;
    });
    return total;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingItem) => CarritoItem(
          id: existingItem.id,
          titulo: existingItem.titulo,
          precio: existingItem.precio,
          cantidad: existingItem.cantidad + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CarritoItem(
          id: productId,
          titulo: title,
          precio: price,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
