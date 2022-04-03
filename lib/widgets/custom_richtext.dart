import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ezwinmobilelegend/styles/app_colors.dart';

class CustomRichText extends StatelessWidget {
  final String discription;
  final String text;
  final Function() onTap;
  const CustomRichText(
      {Key? key,
      required this.discription,
      required this.text,
      required this.onTap})
      : super(key: key);
// "Don't already Have an account? "
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.149,
          vertical: MediaQuery.of(context).size.height * 0.08),
      child: Text.rich(
        TextSpan(
            text: discription,
            style: const TextStyle(color: AppColors.white, fontSize: 16),
            children: [
              TextSpan(
                  text: text,
                  style: const TextStyle(color: AppColors.lime, fontSize: 16),
                  recognizer: TapGestureRecognizer()..onTap = onTap),
            ]),
      ),
    );
  }
}
