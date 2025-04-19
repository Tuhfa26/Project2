import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String result = '';

  void calculate(String operator) {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;

    double answer = 0;
    String symbol = '';

    if (operator == '+') {
      answer = num1 + num2;
      symbol = '+';
    } else if (operator == '-') {
      answer = num1 - num2;
      symbol = '−';
    } else if (operator == '*') {
      answer = num1 * num2;
      symbol = '×';
    } else if (operator == '/') {
      if (num2 != 0) {
        answer = num1 / num2;
        symbol = '÷';
      } else {
        setState(() {
          result = 'Cannot divide by zero';
        });
        return;
      }
    }

    setState(() {
      result = '$num1 $symbol $num2 = ${answer.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'First Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Second Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 15,
              children: [
                ElevatedButton(
                  onPressed: () => calculate('+'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text('➕'),
                ),
                ElevatedButton(
                  onPressed: () => calculate('-'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: Text('➖'),
                ),
                ElevatedButton(
                  onPressed: () => calculate('*'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text('✖️'),
                ),
                ElevatedButton(
                  onPressed: () => calculate('/'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('➗'),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(result, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
