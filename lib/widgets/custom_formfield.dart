import 'package:flutter/material.dart';
import 'package:ezwinmobilelegend/styles/app_colors.dart';
import 'package:ezwinmobilelegend/styles/text_styles.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final int maxLines;

  const CustomFormField(
      {Key? key,
      required this.hintText,
      required this.obsecureText,
      required this.suffixIcon,
      required this.prefixIcon,
      required this.textInputType,
      required this.textInputAction,
      required this.controller,
      required this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: AppColors.trwhite,
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: AppColors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              style: KTextStyle.textFieldTextStyle,
              cursorColor: AppColors.lime,
              maxLines: maxLines,
              controller: controller,
              textInputAction: textInputAction,
              keyboardType: textInputType,
              obscureText: obsecureText,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: KTextStyle.textFieldHintStyle,
                border: InputBorder.none,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
              ),
            ),
          ),
        )
      ],
    );
  }
}
