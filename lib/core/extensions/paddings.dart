import 'package:flutter/material.dart';

extension AnswerButtonPaddingExtension on BuildContext {
  EdgeInsets get answerButtonPadding {
    return MediaQuery.of(this).orientation == Orientation.portrait
        ? EdgeInsets.symmetric(
            horizontal: MediaQuery.of(this).size.width * 0.13,
            vertical: 8,
          )
        : EdgeInsets.symmetric(
            horizontal: MediaQuery.of(this).size.width * 0.2,
            vertical: 8,
          );
  }
}
