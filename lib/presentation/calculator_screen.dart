import 'package:flutter/material.dart';
import 'package:my_calculator/presentation/calculator_logic.dart';
import 'package:my_calculator/presentation/resources/button_info.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.pink[200],
            title: const Text('Calculator',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold))),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
              ),
              width: 350,
              height: 200,
              child: Text(CalculatorLogic.displayedExpression,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25))),
          for (int i = 0; i < 20; i += 4)
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              for (int j = 0; j < 4; j++)
                RoundedButton(
                    buttonTyped: displayExpressions[i + j],
                    buttonColor: buttonColors[i + j])
            ])
        ]));
  }
}

class RoundedButton extends StatefulWidget {
  const RoundedButton(
      {super.key, required this.buttonTyped, required this.buttonColor});

  final String buttonTyped;
  final Color buttonColor;

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}
class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return CircleAvatar(
        backgroundColor: widget.buttonColor,
        radius: 35,
        child: TextButton(
            child: Text(widget.buttonTyped,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            onPressed: () {
              CalculatorLogic.myResult(widget.buttonTyped);
            }));
  }
}
