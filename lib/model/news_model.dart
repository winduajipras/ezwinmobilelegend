import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  String? documentId;
  late String content;
  late Timestamp dateCreate;
  late String header;
  late String image;
  late String category;

  NewsModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    documentId = documentSnapshot.id;
    header = documentSnapshot["header"];
    content = documentSnapshot["content"];
    image = documentSnapshot["image"];
    category = documentSnapshot["category"];
    dateCreate = documentSnapshot["dateCreate"];
  }
}
