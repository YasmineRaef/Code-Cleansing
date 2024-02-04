class CalculatorLogic {
  static double _num1 = 0;
  static String displayedExpression = "0", _operand = "";
  static void myResult(String buttonTyped) {
    switch (buttonTyped) {
      case 'AC':
        [_num1 = 0, displayedExpression = "0", _operand = ""];
      case '+/-':
        displayedExpression[0] != '-'
            ? displayedExpression = '-$displayedExpression'
            : displayedExpression = displayedExpression.substring(1);
      case '+' || '-' || 'x' || '/':
        _num1 = double.parse(displayedExpression);
        _operand = buttonTyped;
        displayedExpression = '';
      case '=':
        displayedExpression =
            _checkButton(_num1, double.parse(displayedExpression), _operand);
      case '%':
        displayedExpression =
            (double.parse(displayedExpression) / 100).toString();
      case 'BACK':
        displayedExpression =
            displayedExpression.substring(0, displayedExpression.length - 1);
      case '.':
        displayedExpression.contains(".")
            ? displayedExpression =
                displayedExpression.substring(0, displayedExpression.length - 1)
            : displayedExpression =
                (double.parse(displayedExpression + buttonTyped)).toString();
      default:
        displayedExpression =
            int.parse(displayedExpression + buttonTyped).toString();
    }
  }

  static String _checkButton(double num1, double num2, String x) => switch (x) {
        '+' => num1 + num2,
        '-' => num1 - num2,
        'x' => num1 * num2,
        '/' => num1 / num2,
        _ => 0
      }.toString();
}
