import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/colors.dart';

abstract class Gradients {
  static const LinearGradient purpleGradient = LinearGradient(
    colors: [
      AppColors.greyWhite,
      AppColors.greyWhite,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
