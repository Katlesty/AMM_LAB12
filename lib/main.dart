import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = '0';

  void buttonPressed(String buttonText) {
    setState(() {
      if (output == '0') {
        output = buttonText;
      } else {
        output += buttonText;
      }
    });
  }

  void clear() {
    setState(() {
      output = '0';
    });
  }

  void calculate() {
    setState(() {
      output = '0'; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(24.0),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            child: Text(
              output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/', isOperator: true),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('*', isOperator: true),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-', isOperator: true),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('C', isClear: true, isOperator: true),
                    buildButton('0'),
                    buildButton('=', isCalculate: true, isSmall: true),
                    buildButton('+', isOperator: true),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String buttonText, {bool isClear = false, bool isCalculate = false, bool isOperator = false, bool isSmall = false}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: isSmall ? 0.75 : 1,
          child: isCalculate
              ? ElevatedButton(
                  onPressed: () {
                    calculate();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Colors.blue,
                    elevation: 5,
                    padding: EdgeInsets.all(20.0),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                )
              : TextButton(
                  onPressed: () {
                    if (isClear) {
                      clear();
                    } else {
                      buttonPressed(buttonText);
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: isOperator ? Colors.blue : Colors.black,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
