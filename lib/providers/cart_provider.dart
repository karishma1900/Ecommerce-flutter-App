import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/providers/cart_item.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Product product) {
    final existingItemIndex = _cartItems.indexWhere((cartItem) => cartItem.product.id == product.id);
    if (existingItemIndex >= 0) {
      // Increase quantity if the item is already in the cart
      _cartItems[existingItemIndex].quantity++;
    } else {
      // Add a new cart item if it doesn't exist
      _cartItems.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    final existingItemIndex = _cartItems.indexWhere((cartItem) => cartItem.product.id == product.id);
    if (existingItemIndex >= 0) {
      if (_cartItems[existingItemIndex].quantity > 1) {
        // Decrease quantity
        _cartItems[existingItemIndex].quantity--;
      } else {
        // Remove the item if quantity is 1
        _cartItems.removeAt(existingItemIndex);
      }
    }
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.product.price * item.quantity; // Calculate total based on quantity
    }
    return total;
  }
}
