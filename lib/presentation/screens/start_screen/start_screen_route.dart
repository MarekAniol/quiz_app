import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/screens/start_screen/start_screen.dart';

Route<dynamic> startScreenRoute(RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (
      context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) =>
        const StartScreen(),
    transitionsBuilder: (
      context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 2.0),
            end: Offset.zero,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(1, -5.0),
            ).animate(secondaryAnimation),
            child: child,
          ));
    },
  );
}
