import 'package:cloud_firestore/cloud_firestore.dart';

class ItemDetail {
  ItemDetail({required this.title, required this.body, required this.id, required});

  final String title;
  String body;
  final String id;

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'body': body,
    };
  }

  factory ItemDetail.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data()!;

    ItemDetail item = ItemDetail(
      title: data['title'],
      body: data['body'],
      id: snapshot.id,
    );

    return item;
  }
}

List<ItemDetail> items = [];
