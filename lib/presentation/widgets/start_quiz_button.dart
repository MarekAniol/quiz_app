import 'package:flutter/material.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/constants/strings.dart';
import 'package:quiz_app/presentation/screens/questions_screen/questions_screen.dart';

class StartQuizButton extends StatelessWidget {
  const StartQuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        Navigator.pushNamed(
          context,
          QuestionsScreen.routeName,
        );
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: AppColors.lightPrimary,
        ),
      ),
      icon: const Icon(
        Icons.play_arrow,
        color: AppColors.white,
      ),
      label: const Text(
        style: TextStyle(
          color: AppColors.white,
        ),
        Strings.startQuizButtonText,
      ),
    );
  }
}
