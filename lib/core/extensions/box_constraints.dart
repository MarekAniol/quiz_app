import 'package:flutter/material.dart';

extension BoxConstrainsExtension on BoxConstraints {
  double get leftQuestionTopPosition => maxHeight * 0.48;
  double get centerQuestionLeftPosition => maxWidth * 0.2;
  double get rightQuestionTopPosition => maxHeight * 0.44;
  double get rightQuestionLeftPosition => maxWidth * 0.55;
}
