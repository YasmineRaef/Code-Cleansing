class CalculatorLogic {
  static String displayedExpression = "";
  static myResult(String buttonTyped) {
    double num1 = 0, num2 = 0, tempNum = 0;
    String result = "", operand = "";
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
    displayedExpression = result;
  }
}
