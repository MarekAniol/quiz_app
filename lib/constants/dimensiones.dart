import 'package:flutter/material.dart';

abstract class Dimensiones {
  static const double leftQuestionMarkSize = 106;
  static const double rightQuestionMarkSize = 96;
  static const double centerQuestionMarkSize = 120;
}

abstract class BoxPredefined {
  static SizedBox get largeVerticalSizedBox => const SizedBox(
        height: 50.0,
      );
}
