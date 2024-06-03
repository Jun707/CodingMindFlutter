import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/item_model.dart';

class FirestoreService {
  static final ref = FirebaseFirestore.instance
      .collection('items')
      .withConverter(
          fromFirestore: ItemDetail.fromFirestore,
          toFirestore: (ItemDetail i, _) => i.toFirestore());

  static Future<void> addItem(ItemDetail item) async {
    await ref.doc(item.id).set(item);
  }

  static Future<QuerySnapshot<ItemDetail>> getAllItemsOnce() {
    return ref.get();
  }

  static Future<void> updateItem(ItemDetail item) async {
    await ref.doc(item.id).update({"body": item.body});
  }

  static Future<void> deleteItem(ItemDetail item) async {
    await ref.doc(item.id).delete();
  }
}
