import 'package:calculator/widgets/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _history = '';
  String _expression = '';
  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void onlyClear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff283637),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(right: 12.0),
            alignment: Alignment(1, 1),
            child: Text(
              _history,
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                fontSize: 24,
                color: Color(0xff545f61),
              )),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            alignment: Alignment(1, 1),
            child: Text(
              _expression,
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                fontSize: 48,
                color: Colors.white,
              )),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                text: 'AC',
                callback: allClear,
                textSize: 20,
                fillColor: 0xFF6c807f,
              ),
              CalcButton(
                text: 'C',
                callback: onlyClear,
                fillColor: 0xFF6c807f,
              ),
              CalcButton(
                text: '%',
                callback: numClick,
                fillColor: 0xFFFFFFFF,
                textColor: 0xff65bdac,
              ),
              CalcButton(
                text: '/',
                callback: numClick,
                fillColor: 0xFFFFFFFF,
                textColor: 0xff65bdac,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                text: '7',
                callback: numClick,
              ),
              CalcButton(
                text: '8',
                callback: numClick,
              ),
              CalcButton(
                text: '9',
                callback: numClick,
              ),
              CalcButton(
                text: '*',
                callback: numClick,
                fillColor: 0xFFFFFFFF,
                textColor: 0xff65bdac,
                textSize: 24,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                text: '4',
                callback: numClick,
              ),
              CalcButton(
                text: '5',
                callback: numClick,
              ),
              CalcButton(
                text: '6',
                callback: numClick,
              ),
              CalcButton(
                text: '-',
                callback: numClick,
                textSize: 38,
                fillColor: 0xFFFFFFFF,
                textColor: 0xff65bdac,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                text: '1',
                callback: numClick,
              ),
              CalcButton(
                text: '2',
                callback: numClick,
              ),
              CalcButton(
                text: '3',
                callback: numClick,
              ),
              CalcButton(
                text: '+',
                callback: numClick,
                fillColor: 0xFFFFFFFF,
                textColor: 0xff65bdac,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                text: '.',
                callback: numClick,
              ),
              CalcButton(
                text: '0',
                callback: numClick,
              ),
              CalcButton(
                text: '00',
                callback: numClick,
                textSize: 26,
              ),
              CalcButton(
                text: '=',
                callback: evaluate,
                fillColor: 0xFFFFFFFF,
                textColor: 0xff65bdac,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
