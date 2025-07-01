import 'package:flutter/material.dart';
import 'package:insulin_sensitivity_estimator/helpers/size_extension.dart';

Widget sizedBoxWithHeight(int? height) {
  return SizedBox(
    height: height!.h,
  );
}

Widget sizedBoxWithWidth(int? width) {
  return SizedBox(
    width: width!.w,
  );
}
