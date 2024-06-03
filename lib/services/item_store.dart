import 'package:flutter/material.dart';
import 'package:myapp/models/item_model.dart';
import 'package:myapp/services/firestore_service.dart';

class ItemStore extends ChangeNotifier {
  final List<ItemDetail> _items = [];

  get items => _items;

  void addItem(ItemDetail item) async {
    await FirestoreService.addItem(item);
    _items.add(item);
    notifyListeners();
  }

  void fetchItemsOnce() async {
    if (items.length == 0) {
      final snapshot = await FirestoreService.getAllItemsOnce();

      for (var doc in snapshot.docs) {
        _items.add(doc.data());
      }

      notifyListeners();
    }
  }

  Future<void> saveItem(ItemDetail item) async {
    await FirestoreService.updateItem(item);
    return;
  }

  void deleteItem(ItemDetail item) async {
    await FirestoreService.deleteItem(item);
    _items.remove(item);
    notifyListeners();
  }
}
