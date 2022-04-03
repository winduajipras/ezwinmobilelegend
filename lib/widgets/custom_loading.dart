import 'package:ezwinmobilelegend/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.navy.withOpacity(0.7),
      child: const SpinKitFoldingCube(
        color: AppColors.lime,
      ),
    );
  }
}
