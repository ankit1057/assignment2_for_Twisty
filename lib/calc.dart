import 'package:assignment2/result_display.dart';
import 'package:flutter/material.dart';

import 'calc_button.dart';
import 'get_button.dart';

class Calculation extends StatefulWidget {
  const Calculation({Key key}) : super(key: key);

  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  double result;
  double width;
  double firstOperand;
  String operator;
  double secondOperand;

  @override
  void didChangeDependencies() {
    width = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResultDisplay(text: _getDisplayText()),
        Row(
          children: [
            getButton(text: '7', onTap: () => numberPressed(7)),
            getButton(text: '8', onTap: () => numberPressed(8)),
            getButton(text: '9', onTap: () => numberPressed(9)),
            getButton(
                text: 'x',
                onTap: () => operatorPressed('*'),
                backgroundColor: Color.fromRGBO(220, 220, 220, 1)),
          ],
        ),
        Row(
          children: [
            getButton(text: '4', onTap: () => numberPressed(4)),
            getButton(text: '5', onTap: () => numberPressed(5)),
            getButton(text: '6', onTap: () => numberPressed(6)),
            getButton(
                text: '/',
                onTap: () => operatorPressed('/'),
                backgroundColor: Color.fromRGBO(220, 220, 220, 1)),
          ],
        ),
        Row(
          children: [
            getButton(text: '1', onTap: () => numberPressed(1)),
            getButton(text: '2', onTap: () => numberPressed(2)),
            getButton(text: '3', onTap: () => numberPressed(3)),
            getButton(
                text: '+',
                onTap: () => operatorPressed('+'),
                backgroundColor: Color.fromRGBO(220, 220, 220, 1))
          ],
        ),
        Row(
          children: [
            getButton(
                text: '=',
                onTap: calculateResult,
                backgroundColor: Colors.orange,
                textColor: Colors.white),
            getButton(text: '0', onTap: () => numberPressed(0)),
            getButton(
                text: 'C',
                onTap: clear,
                backgroundColor: Color.fromRGBO(220, 220, 220, 1)),
            getButton(
                text: '-',
                onTap: () => operatorPressed('-'),
                backgroundColor: Color.fromRGBO(220, 220, 220, 1)),
          ],
        ),
      ],
    );
  }

  operatorPressed(String operator) {
    setState(() {
      if (firstOperand == null) {
        firstOperand = 0;
      }
      this.operator = operator;
    });
  }

  numberPressed(double number) {
    setState(() {
      if (result != null) {
        result = null;
        firstOperand = number;
        return;
      }
      if (firstOperand == null) {
        firstOperand = number;
        return;
      }
      if (operator == null) {
        firstOperand = double.parse('$firstOperand$number');
        return;
      }
      if (secondOperand == null) {
        secondOperand = number;
        return;
      }
      secondOperand = double.parse('$secondOperand$number');
    });
  }

  calculateResult() {
    if (operator == null || secondOperand == null) {
      return;
    }
    setState(() {
      switch (operator) {
        case '+':
          result = firstOperand + secondOperand;
          break;
        case '-':
          result = firstOperand - secondOperand;
          break;
        case '*':
          result = firstOperand * secondOperand;
          break;
        case '/':
          if (secondOperand == 0) {
            return;
          }
          result = (firstOperand / secondOperand);
          break;
      }
      firstOperand = result;
      operator = null;
      secondOperand = null;
      result = null;
    });
  }

  clear() {
    setState(() {
      result = null;
      operator = null;
      secondOperand = null;
      firstOperand = null;
    });
  }
  String _getDisplayText() {
    if (result != null) {
      return '$result';
    }
    if (secondOperand != null) {
      return '$firstOperand$operator$secondOperand';
    }
    if (operator != null) {
      return '$firstOperand$operator';
    }
    if (firstOperand != null) {
      return '$firstOperand';
    }
    return '0';
  }
  Widget getButton(
      {String text,
        Function onTap,
        Color backgroundColor = Colors.white,
        Color textColor = Colors.black}) {
    return CalculatorButton(
      label: text,
      OnTap: onTap,
      size: width / 4 - 12,
      backgroundColor: backgroundColor,
      labelColor: textColor,
    );
  }
}
