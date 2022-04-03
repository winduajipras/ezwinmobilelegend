import 'package:ezwinmobilelegend/helper/firestore_db.dart';
import 'package:ezwinmobilelegend/model/news_model.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  Rx<List<NewsModel>> newsList = Rx<List<NewsModel>>([]);
  List<NewsModel> get news => newsList.value;

  @override
  void onReady() {
    newsList.bindStream(FirestoreDb().newsStream());
  }
}
