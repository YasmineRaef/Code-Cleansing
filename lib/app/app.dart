import 'package:flutter/material.dart';
import 'package:my_calculator/presentation/calculator_screen.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: CalculatorScreen(), debugShowCheckedModeBanner: false);
  }
}
