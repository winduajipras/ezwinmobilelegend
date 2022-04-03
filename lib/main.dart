import 'package:ezwinmobilelegend/screens/signin.dart';
import 'package:ezwinmobilelegend/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ezwinmobilelegend/controllers/auth_controller.dart';
import 'package:ezwinmobilelegend/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await firebaseInitialization.then((value) => {
          Get.put(AuthController()),
        });
  } catch (e) {}

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Palette.secondary,
      ),
      home: const Signin(),
    );
  }
}
