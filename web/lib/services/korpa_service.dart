import 'dart:collection';

import 'package:slatkizalogaj/model/torta.dart';

class ShoppingCartService {
  static Map<Torta, int> _cart = LinkedHashMap<Torta, int>();
  static final List<Map<Torta, int>> _orders = [];

  // Add an object to the cart with a specified amount
  static void add(Torta object, int amount) {
    if (_cart.containsKey(object)) {
      if (_cart[object] != null) {
        _cart[object] = (_cart[object] ?? 0) + amount;
      }
    } else {
      _cart[object] = amount;
    }
  }

  static get orders => _orders;

  // Remove an object from the cart
  static void remove(Torta torta) {
    _cart.remove(torta);
  }

  //reset cart
  static void resetCart() {
    _cart.clear();
  }

  static void addOrder() {
    _orders.add(_cart);
    _cart = LinkedHashMap<Torta, int>();
  }

  static removeOrder(int index) {
    _orders.removeAt(index);
  }

  // Increase the amount of an object in the cart
  static void increaseAmount(Torta object, int amount) {
    if (_cart.containsKey(object)) {
      if (_cart[object] != null) {
        _cart[object] = (_cart[object] ?? 0) + amount;
      }
    }
  }

  // Calculate the total price of items in the cart
  static double calculateTotal() {
    double total = 0.0;
    _cart.forEach((key, value) {
      total += key.price * value;
    });
    return total;
  }

  static claculateTotalOrder(int index) {
    double total = 0.0;
    _orders[index].forEach((key, value) {
      total += key.price * value;
    });
    return total;
  }

  //Get number of items in cart
  static int getCartSize() {
    return _cart.length;
  }

  //get item by index
  static Torta getCartItem(int index) {
    return _cart.keys.elementAt(index);
  }

  //get item amount by index
  static int getCartItemAmount(int index) {
    return _cart.values.elementAt(index);
  }
}
