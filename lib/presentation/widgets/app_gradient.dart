import 'package:flutter/material.dart';
import 'package:quiz_app/constants/gradients.dart';

class AppGradient extends StatelessWidget {
  const AppGradient({
    required this.child,
    super.key,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: Gradients.purpleGradient,
      ),
      child: child,
    );
  }
}
