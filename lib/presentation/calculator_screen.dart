import 'package:flutter/material.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({super.key});

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  double num1 = 0;
  double num2 = 0;
  double tempNum = 0;
  String result = "";
  String operand = "";
  String displayedExpression = "";
  Widget roundedButton(
    String buttonTyped,
    Color buttonColor,
  ) {
    return CircleAvatar(
        backgroundColor: buttonColor,
        radius: 35,
        child: TextButton(
            child: Text(
              buttonTyped,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            onPressed: () {
              myResult(buttonTyped);
            }));
  }

  myResult(String buttonTyped) {
    if (buttonTyped == 'AC') {
      num1 = 0;
      num2 = 0;
      result = '';
      operand = '';
      displayedExpression = '';
    } else if (buttonTyped == '+/-') {
      if (displayedExpression[0] != '-') {
        result = '-$displayedExpression';
      } else {
        result = displayedExpression.substring(1, displayedExpression.length);
      }
    } else if (buttonTyped == '+' ||
        buttonTyped == '-' ||
        buttonTyped == 'x' ||
        buttonTyped == '/') {
      num1 = double.parse(displayedExpression);
      operand = buttonTyped;
      result = '';
    } else if (buttonTyped == '=') {
      num2 = double.parse(displayedExpression);
      if (operand == '+') {
        result = (num1 + num2).toString();
      } else if (operand == '-') {
        result = (num1 - num2).toString();
      } else if (operand == 'x') {
        result = (num1 * num2).toString();
      } else if (operand == '/') {
        result = (num1 / num2).toString();
      }
    } else if (buttonTyped == '%') {
      tempNum = double.parse(displayedExpression);
      tempNum /= 100;
      result = tempNum.toString();
    } else if (buttonTyped == 'BACK') {
      result = displayedExpression.substring(0, displayedExpression.length - 1);
    } else if (buttonTyped == '.') {
      if (displayedExpression.contains(".")) {
        result =
            displayedExpression.substring(0, displayedExpression.length - 1);
      } else {
        result = (double.parse(displayedExpression + buttonTyped)).toString();
      }
    } else {
      result = int.parse(displayedExpression + buttonTyped).toString();
    }
    setState(() {
      displayedExpression = result;
      //res = int.parse(displayed).toString();
    });
  }

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
              child: Text(displayedExpression,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25))),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            roundedButton('AC', Colors.green[200]!),
            roundedButton('+/-', Colors.blue[200]!),
            roundedButton('%', Colors.blue[200]!),
            roundedButton('/', Colors.blue[200]!)
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            roundedButton('7', Colors.indigoAccent[100]!),
            roundedButton('8', Colors.indigoAccent[100]!),
            roundedButton('9', Colors.indigoAccent[100]!),
            roundedButton('x', Colors.blue[200]!)
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            roundedButton('4', Colors.indigoAccent[100]!),
            roundedButton('5', Colors.indigoAccent[100]!),
            roundedButton('6', Colors.indigoAccent[100]!),
            roundedButton('-', Colors.blue[200]!)
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            roundedButton('1', Colors.indigoAccent[100]!),
            roundedButton('2', Colors.indigoAccent[100]!),
            roundedButton('3', Colors.indigoAccent[100]!),
            roundedButton('+', Colors.blue[200]!)
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            roundedButton('BACK', Colors.pink[200]!),
            roundedButton('0', Colors.pink[200]!),
            roundedButton('.', Colors.pink[200]!),
            roundedButton('=', Colors.green[200]!)
          ])
        ]));
  }
}
