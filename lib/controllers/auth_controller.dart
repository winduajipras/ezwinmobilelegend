// ignore_for_file: empty_catches

import 'package:ezwinmobilelegend/screens/navigation.dart';
import 'package:ezwinmobilelegend/screens/signin.dart';
import 'package:ezwinmobilelegend/styles/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ezwinmobilelegend/utils/constants.dart';

class AuthController extends GetxController {
  var isLoading = false;
  static AuthController instance = Get.find();

  late Rx<User?> firebaseUser;

  @override
  void onInit() {
    super.onInit();

    firebaseUser = Rx<User?>(firebaseAuth.currentUser);

    firebaseUser.bindStream(firebaseAuth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    Future.delayed(const Duration(seconds: 1), () {
      Get.find<AuthController>().isLoading = false;
      if (user == null) {
        Get.offAll(() => const Signin());
      } else {
        Get.offAll(() => const NavigationScreen());
      }
    });
  }

  void register(String email, password) async {
    Get.find<AuthController>().isLoading = true;
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (firebaseAuthException) {
      Get.find<AuthController>().isLoading = false;
      Get.snackbar(
        "Error",
        firebaseAuthException.toString().split("] ")[1],
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.status,
      );
    }
  }

  void login(String email, String password) async {
    Get.find<AuthController>().isLoading = true;
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (firebaseAuthException) {
      Get.find<AuthController>().isLoading = false;
      Get.snackbar(
        "Error",
        firebaseAuthException.toString().split("] ")[1],
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.status,
      );
    }
  }

  void logout() async {
    Get.find<AuthController>().isLoading = true;
    try {
      await firebaseAuth.signOut();
    } catch (firebaseAuthException) {
      Get.find<AuthController>().isLoading = false;
      Get.snackbar(
        "Error",
        firebaseAuthException.toString().split("] ")[1],
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.status,
      );
    }
  }
}
