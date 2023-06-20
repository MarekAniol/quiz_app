import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/colors.dart';
import 'package:quiz_app/core/constants/dimensiones.dart';
import 'package:quiz_app/core/constants/rotations.dart';
import 'package:quiz_app/core/extensions/box_constraints.dart';

class QuestionMarksWidget extends StatelessWidget {
  const QuestionMarksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: 200.0,
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: <Widget>[
            Positioned(
              top: constraints.leftQuestionTopPosition,
              child: const _SingleQuestionMarkWidget(
                angle: Rotations.leftQuestionMarkRotation,
                size: Dimensiones.leftQuestionMarkSize,
              ),
            ),
            Positioned(
              left: constraints.centerQuestionLeftPosition,
              child: const _SingleQuestionMarkWidget(
                angle: Rotations.centerQuestionMarkRotation,
                size: Dimensiones.centerQuestionMarkSize,
              ),
            ),
            Positioned(
              top: constraints.rightQuestionTopPosition,
              left: constraints.rightQuestionLeftPosition,
              child: const _SingleQuestionMarkWidget(
                angle: Rotations.rightQuestionMarkRotation,
                size: Dimensiones.rightQuestionMarkSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SingleQuestionMarkWidget extends StatelessWidget {
  const _SingleQuestionMarkWidget({
    required this.angle,
    required this.size,
  });

  final double angle;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Icon(
        Icons.help_outline,
        color: AppColors.questionMarksColor,
        size: size,
      ),
    );
  }
}
