import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _output = "0";  // Initial output
  double _num1 = 0;      // First number
  String _operator = "";  // Operator

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";  // Clear button
      _num1 = 0;      // Reset first number
      _operator = "";  // Reset operator
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
      _num1 = double.parse(_output);  // Store the first number
      _operator = buttonText;          // Set the operator
      _output = "0";                   // Reset output for next number
    } else if (buttonText == "=") {
      double _num2 = double.parse(_output);  // Get the second number
      switch (_operator) {
        case "+":
          _output = (_num1 + _num2).toString();  // Perform addition
          break;
        case "-":
          _output = (_num1 - _num2).toString();  // Perform subtraction
          break;
        case "*":
          _output = (_num1 * _num2).toString();  // Perform multiplication
          break;
        case "/":
          _output = _num2 == 0 ? "Error" : (_num1 / _num2).toString();  // Perform division
          break;
      }
      _operator = "";  // Reset operator
    } else {
      if (_output == "0") {
        _output = buttonText;  // Replace initial zero
      } else {
        _output += buttonText;  // Append to existing output
      }
    }

    setState(() {
      // Update display
    });
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(24),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("/"),
                ],
              ),
              Row(
                children: [
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("*"),
                ],
              ),
              Row(
                children: [
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("-"),
                ],
              ),
              Row(
                children: [
                  _buildButton("."),
                  _buildButton("0"),
                  _buildButton("C"),
                  _buildButton("+"),
                ],
              ),
              Row(
                children: [
                  _buildButton("="),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
