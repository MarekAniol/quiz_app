import 'package:flutter/material.dart';

extension AnswerButtonPaddingExtension on BuildContext {
  EdgeInsets get answerButtonPadding {
    return const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    );
  }

  EdgeInsets get appPadding {
    return MediaQuery.of(this).orientation == Orientation.portrait
        ? const EdgeInsets.symmetric(
            horizontal: 40,
          )
        : EdgeInsets.symmetric(
            horizontal: MediaQuery.of(this).size.width * 0.2,
          );
  }
}
