import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../styling.dart';

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String output = "0";
  String result = "0";
  String expression = '';
  double outputFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(buttonText) {
   
    setState(() {
      if (buttonText == "C") {
        output = '0';
        result = '0';
        outputFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "⌫") {
        output = output.substring(0, output.length - 1);
        resultFontSize = 48.0;
        outputFontSize = 38.0;
        if (output == '') {
          output = '0';
        }
      } else if (buttonText == '=') {
        resultFontSize = 38.0;
        outputFontSize = 48.0;

        expression = output;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '/ 100');
        try {
          Parser p = Parser();
          Expression ex = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${ex.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'Invalid expression';
        }
      } else {
        resultFontSize = 38.0;
        outputFontSize = 48.0;

        if (output == '0') {
          output = buttonText;
        } else {
          output = output + buttonText;
        }
      }
    });
  }

  Widget buttonsBuilder(String buttonText, double buttonHeight,
      [Color buttonColor]) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * 1,
      padding: const EdgeInsets.all(5),
      child: RaisedButton(
        color: buttonColor,
        textColor: themeButton ? dtTextColor : ltTextColor,
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(width: 1, style: BorderStyle.solid)),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: buttonFontSize,
        ),
      ),
    );
  }

  bool themeButton = false;
  Color themeStyle() {
    if (themeButton) {
      return Colors.grey[850];
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeButton ? Colors.grey[850] : null,
      appBar: AppBar(
          backgroundColor: themeStyle(),
          elevation: 0,
          brightness: themeButton ? Brightness.dark : Brightness.light,
          leading: IconButton(
              icon: Icon(Icons.info,
                  color: themeButton ? dtIconColor : ltIconColor),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 0,
                          child: Stack(children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(
                                top: 66.0 + 16.0,
                                bottom: 16.0,
                                right: 16.0,
                                left: 16.0,
                              ),
                              margin: EdgeInsets.only(top: 30.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 16.0,
                                      offset: const Offset(0.0, 16.0),
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  'Author: Ibrahim Usman \n \n Github : @Uzi_ibm \n Code Clan Nigeria',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 28.0 + 64.0,
                              right: 30.0 + 64.0,
                              child: CircleAvatar(
                                backgroundImage: AssetImage('assets/dp.jpg'),
                                radius: 50.0,
                              ),
                            )
                          ]),
                        ));
              }),
          title: Text(
            'Basic Calculator',
            style: TextStyle(
                color: themeButton ? Colors.blueAccent : Colors.grey[850],
                fontSize: 25),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  setState(() {
                    themeButton = !themeButton;
                  });
                },
                icon: themeButton
                    ? Icon(
                        Icons.brightness_3,
                        color: themeButton ? dtIconColor : ltIconColor,
                      )
                    : Icon(
                        Icons.wb_sunny,
                        color: themeButton ? dtIconColor : ltIconColor,
                      )),
          ]),
      body: Column(children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.fromLTRB(10, 20, 20, 0),
          child: Text(
            output,
            style: TextStyle(
                fontSize: outputFontSize,
                color: themeButton ? dtTextColor : ltTextColor),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.fromLTRB(10, 30, 20, 0),
          child: Text(
            result,
            style: TextStyle(
                fontSize: resultFontSize,
                color: themeButton ? dtTextColor : ltTextColor),
          ),
        ),
        SizedBox(height: 50.0),
        Expanded(
            // flex: 1,
            child: Divider(
          thickness: 3,
          //color: Colors.grey[300],
        )),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Table(children: [
                TableRow(children: [
                  buttonsBuilder('C', 1, Colors.green),
                  buttonsBuilder('⌫', 1, Colors.red),
                  buttonsBuilder('%', 1, Colors.orange),
                ]),
                TableRow(children: [
                  buttonsBuilder(
                      '7', 1, themeButton ? Colors.grey[600] : Colors.white),
                  buttonsBuilder(
                      '8', 1, themeButton ? Colors.grey[600] : Colors.white),
                  buttonsBuilder(
                      '9', 1, themeButton ? Colors.grey[600] : Colors.white)
                ]),
                TableRow(children: [
                  buttonsBuilder(
                      '4', 1, themeButton ? Colors.grey[600] : Colors.white),
                  buttonsBuilder(
                      '5', 1, themeButton ? Colors.grey[600] : Colors.white),
                  buttonsBuilder(
                      '6', 1, themeButton ? Colors.grey[600] : Colors.white),
                ]),
                TableRow(children: [
                  buttonsBuilder(
                      '1', 1, themeButton ? Colors.grey[600] : Colors.white),
                  buttonsBuilder(
                      '2', 1, themeButton ? Colors.grey[600] : Colors.white),
                  buttonsBuilder(
                      '3', 1, themeButton ? Colors.grey[600] : Colors.white),
                ]),
                TableRow(children: [
                  buttonsBuilder(
                      '.', 1, themeButton ? Colors.grey[600] : Colors.white),
                  buttonsBuilder(
                      '0', 1, themeButton ? Colors.grey[600] : Colors.white),
                  buttonsBuilder(
                      '00', 1, themeButton ? Colors.grey[600] : Colors.white),
                ]),
              ])),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Table(
              children: [
                TableRow(children: [
                  buttonsBuilder('÷', 1, Colors.orange),
                ]),
                TableRow(children: [
                  buttonsBuilder('×', 1, Colors.orange),
                ]),
                TableRow(children: [
                  buttonsBuilder('-', 1, Colors.orange),
                ]),
                TableRow(children: [
                  buttonsBuilder('+', 1, Colors.orange),
                ]),
                TableRow(children: [
                  buttonsBuilder('=', 1, Colors.blueAccent),
                ]),
              ],
            ),
          )
        ])
      ]),
    );
  }
}
