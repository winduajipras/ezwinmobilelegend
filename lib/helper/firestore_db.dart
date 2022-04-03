import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezwinmobilelegend/utils/constants.dart';
import 'package:ezwinmobilelegend/model/news_model.dart';
import 'package:get/get.dart';

class FirestoreDb extends GetxController {
  Stream<List<NewsModel>> newsStream() {
    return firebaseFirestore
        .collection('news')
        .snapshots()
        .map((QuerySnapshot query) {
      List<NewsModel> news = [];
      for (var todo in query.docs) {
        final newsModel =
            NewsModel.fromDocumentSnapshot(documentSnapshot: todo);
        news.add(newsModel);
      }
      news.sort((a, b) => b.dateCreate.compareTo(a.dateCreate));
      return news;
    });
  }
}
