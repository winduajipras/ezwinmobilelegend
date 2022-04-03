import 'package:flutter/material.dart';

import 'app_colors.dart';

class KTextStyle {
  static const headerAuthTextStyle = TextStyle(
      color: AppColors.lime, fontSize: 23, fontWeight: FontWeight.w600);

  static const headerNewsTextStyle = TextStyle(
      color: AppColors.white, fontSize: 10, fontWeight: FontWeight.w600);

  static const categoryNewsTextStyle = TextStyle(
      color: AppColors.navy, fontSize: 12, fontWeight: FontWeight.w900);

  static const moreNewsTextStyle = TextStyle(
      color: AppColors.status, fontSize: 14, fontWeight: FontWeight.w600);

  static const contentNewsTextStyle = TextStyle(
      color: AppColors.navy, fontSize: 12, fontWeight: FontWeight.w500);

  static const bottomNavigationBarSelectedTextStyle = TextStyle(
      color: AppColors.lime, fontSize: 11, fontWeight: FontWeight.w600);

  static const bottomNavigationBarUnselectedTextStyle = TextStyle(
      color: AppColors.navy, fontSize: 11, fontWeight: FontWeight.w600);

  static const textFieldHintStyle = TextStyle(
      color: AppColors.hintText, fontSize: 14, fontWeight: FontWeight.w500);

  static const textFieldTextStyle = TextStyle(
      color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w500);

  static const authButtonTextStyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.navy);

  static const profileNameTextStyle = TextStyle(
      color: AppColors.navy, fontSize: 20, fontWeight: FontWeight.w600);

  static const profileStatusTextStyle = TextStyle(
      color: AppColors.hintText, fontSize: 14, fontWeight: FontWeight.w400);
}
