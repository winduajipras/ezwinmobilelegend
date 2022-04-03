import 'package:ezwinmobilelegend/utils/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<String> loadImage(String path, String filename) async {
  Reference ref = firebaseStorage.ref().child(path).child(filename);

  //get image url from firebase storage
  var url = await ref.getDownloadURL();
  return url;
}
