import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double size = 0;

  String inputvalue = "";

  String Calculatedvalue = "";

  String operator = "";
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 5;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                inputvalue,
                style: TextStyle(color: Colors.white, fontSize: 100),
              ),
            ),

            Column(
              children: [
                Row(
                  children: [
                    calcButton("7", Colors.white54),
                    calcButton("8", Colors.white54),
                    calcButton("9", Colors.white54),
                    calcButton("/", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton("4", Colors.white54),
                    calcButton("5", Colors.white54),
                    calcButton("6", Colors.white54),
                    calcButton("*", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton("1", Colors.white54),
                    calcButton("2", Colors.white54),
                    calcButton("3", Colors.white54),
                    calcButton("-", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton("0", Colors.white54),
                    calcButton(".", Colors.white54),
                    calcButton("=", Colors.orange),
                    calcButton("+", Colors.orange),
                  ],
                ),
              ],
            ),
            calcButton("clear", Colors.black),
          ],
        ),
      ),
    );
  }

  Widget calcButton(String text, Color bgcolor) {
    return InkWell(
      onTap: () {
        if (text == "clear") {
          setState(() {
            inputvalue = "";
            Calculatedvalue = "";
            operator = "";
          });
        } else if (text == "+" || text == "- " || text == "*" || text == "/") {
          setState(() {
            Calculatedvalue = inputvalue;
            inputvalue = "";

            operator = text;
          });
        } else if (text == "=") {
          setState(() {
            double calc = double.parse(Calculatedvalue);
            double input = double.parse(inputvalue);

            if (operator == "+") {
              inputvalue = (calc + input).toString();
            } else if (operator == "-") {
              inputvalue = (calc - input).toString();
            } else if (operator == "*") {
              inputvalue = (calc * input).toString();
            } else if (operator == "/") {
              inputvalue = (calc / input).toString();
            }
          });
        } else {
          setState(() {
            inputvalue = inputvalue + text;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.all(10),
        height: size,
        width: size,
        alignment: Alignment.center,

        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
  }
}
