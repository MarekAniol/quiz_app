import 'package:flutter/material.dart';

abstract class Gradients {
  static const LinearGradient purpleGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 69, 7, 110),
      Color.fromARGB(255, 105, 30, 192),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
