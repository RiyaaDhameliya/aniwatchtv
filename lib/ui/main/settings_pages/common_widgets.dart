import 'package:flutter/material.dart';

import '../../../constant/app_color.dart';



SizedBox buildSizedBoxH(double height) {
  return SizedBox(
    height: height,
  );
}


SizedBox buildSizedBoxW(double width) {
  return SizedBox(
    width: width,
  );
}


Divider buildDivider(Size size) {
  return Divider(
    color: grey,
    thickness: 0.10,
    height: size.height * 0.01,
  );
}