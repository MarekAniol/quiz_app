import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/borders.dart';
import 'package:quiz_app/core/constants/colors.dart';
import 'package:quiz_app/core/extensions/paddings.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    required this.answerText,
    required this.onPressed,
    super.key,
  });

  final String answerText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: context.answerButtonPadding,
        backgroundColor: AppColors.primaryGreenColor,
        shape: RoundedRectangleBorder(
          borderRadius: Borders.answerButtonBorderRadius,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        answerText,
        style: const TextStyle(
          color: AppColors.greyWhite,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
