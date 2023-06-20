import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/colors.dart';
import 'package:quiz_app/core/constants/strings.dart';
import 'package:quiz_app/presentation/screens/start_screen/start_screen.dart';

class RestartQuizButton extends StatelessWidget {
  const RestartQuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        Navigator.pushNamed(
          context,
          StartScreen.routeName,
        );
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: AppColors.primaryGreenColor,
        ),
      ),
      icon: const Icon(
        Icons.replay,
        color: AppColors.primaryGreenColor,
      ),
      label: const Text(
        style: TextStyle(
          color: AppColors.greyBlack,
        ),
        Strings.restartQuizButtonText,
      ),
    );
  }
}
