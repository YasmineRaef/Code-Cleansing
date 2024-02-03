class CalculatorLogic {
  static String displayedExpression = "";
  static myResult(String buttonTyped) {
    double num1 = 0, num2 = 0, tempNum = 0;
    String result = "", operand = "";
    if (buttonTyped == '+/-') {
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
      result = checkButton(num1, num2, buttonTyped).toString();
    } else if (buttonTyped == '%') {
      tempNum = double.parse(displayedExpression);
      result = (tempNum /= 100).toString();
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
    displayedExpression = result;
  }
}

double checkButton(double num1, double num2, var x) {
  double res = 0;
  switch (x) {
    case '+':
      res = num1 + num2;
      break;
    case '-':
      res = num1 - num2;
      break;
    case 'x':
      res = num1 * num2;
      break;
    case '/':
      res = num1 / num2;
      break;
  }
  return res;
}
