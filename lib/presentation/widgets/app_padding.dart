import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/paddings.dart';

class AppPadding extends StatelessWidget {
  const AppPadding({
    required this.child,
    super.key,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.appPadding,
      child: child,
    );
  }
}
