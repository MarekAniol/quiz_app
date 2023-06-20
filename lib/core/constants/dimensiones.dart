import 'package:flutter/material.dart';

abstract class Dimensiones {
  static const double leftQuestionMarkSize = 106;
  static const double rightQuestionMarkSize = 96;
  static const double centerQuestionMarkSize = 120;
  static const double answersBoxHeight = 400;
  static const double answerNumber = 26;
}

abstract class BoxPredefined {
  static SizedBox get verticalSizedBox50 => const SizedBox(
        height: 50.0,
      );
  static SizedBox get verticalSizedBox30 => const SizedBox(
        height: 30.0,
      );
  static SizedBox get verticalSizedBox20 => const SizedBox(
        height: 20.0,
      );

  static SizedBox get horizontalSizedBox10 => const SizedBox(
        width: 10.0,
      );
}

abstract class BordersPredefined {
  static SizedBox get verticalSizedBox50 => const SizedBox(
        height: 50.0,
      );
  static SizedBox get verticalSizedBox30 => const SizedBox(
        height: 30.0,
      );
}
