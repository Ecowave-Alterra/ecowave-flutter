import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_model.dart';

class CartService {
  late SharedPreferences _preferences;
  List<CartModel> items = [];

  CartService() {
    init();
  }

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    items = _getItemsFromLocalStorage() ?? [];
  }

  List<CartModel>? _getItemsFromLocalStorage() {
    final List<String>? itemStrings = _preferences.getStringList('items');
    if (itemStrings != null) {
      return itemStrings
          .map((itemString) => CartModel.fromJson(itemString))
          .toList();
    }
    return null;
  }

  Future<void> saveToLocalStorage() async {
    await _preferences.setStringList(
      'items',
      items.map((item) => item.toJson()).toList(),
    );
    items = _getItemsFromLocalStorage() ?? [];
  }

  void addItem(CartModel cartModel) {
    items.add(cartModel);
    saveToLocalStorage();
  }

  void deleteItem(String id) {
    items.removeWhere(
      (element) => element.id == id,
    );
    saveToLocalStorage();
  }

  void addTotalItem(String id) {
    final int targetIndex = items.indexWhere((data) => data.id == id);
    items[targetIndex].totalItems++;
    saveToLocalStorage();
  }

  void reduceTotalItem(String id) {
    final int targetIndex = items.indexWhere((data) => data.id == id);
    if (items[targetIndex].totalItems > 1) {
      items[targetIndex].totalItems--;
      saveToLocalStorage();
    }
  }

  void deleteAllItems() {
    items.clear();
    saveToLocalStorage();
  }
}
