import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String screenAPP = '';
  double firstNumbersScr = 0.0;
  String symbolMath = '';

  void calc(String numberKeyboard) {
    switch (numberKeyboard) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(() {
          screenAPP += numberKeyboard;
          screenAPP = screenAPP.replaceAll(',', '.');
          if (screenAPP.contains('.')) {
          } else {
            int numberKeyboardInt = int.parse(screenAPP);
            screenAPP = numberKeyboardInt.toString();
          }
          screenAPP = screenAPP.replaceAll('.', ',');
        });
        break;
      case '+':
      case '-':
      case 'x':
      case '/':
        symbolMath = numberKeyboard;
        screenAPP = screenAPP.replaceAll(',', '.');
        firstNumbersScr = double.parse(screenAPP);
        screenAPP = screenAPP.replaceAll('.', ',');
        screenAPP = '0';
        break;
      case '=':
        late double resultCalc;

        if (symbolMath == '+') {
          resultCalc = firstNumbersScr + double.parse(screenAPP);
        }

        if (symbolMath == '-') {
          resultCalc = firstNumbersScr - double.parse(screenAPP);
        }

        if (symbolMath == 'x') {
          resultCalc = firstNumbersScr * double.parse(screenAPP);
        }

        if (symbolMath == '/') {
          resultCalc = firstNumbersScr / double.parse(screenAPP);
        }

        String resultCalcString = resultCalc.toString();

        List<String> resultCalcZero = resultCalcString.split('.');

        if (int.parse(resultCalcZero[1]) * 1 == 0) {
          int resultCalcInt = int.parse(resultCalcZero[0]);
          setState(() {
            screenAPP = resultCalcInt.toString();
          });
        } else {
          setState(() {
            screenAPP = resultCalc.toString();
          });
        }
        break;
      case 'AC':
        setState(() {
          screenAPP = '';
        });
        break;

      default:
        screenAPP += numberKeyboard;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('Calculadora'),
            ),
          ),
          body: Column(
            /***************
             * screen
             * *************/
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    screenAPP,
                    style: const TextStyle(fontSize: 70),
                  ),
                ],
              ),
              /***************
              * keyboard
              * **************/
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      calc('AC');
                    },
                    child: const Text(
                      'AC',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  const Text(''),
                  const Text(''),
                  GestureDetector(
                    onTap: () {
                      calc('<-');
                    },
                    child: const Text(
                      '<-',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      calc('7');
                    },
                    child: const Text(
                      '7',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      calc('8');
                    },
                    child: const Text(
                      '8',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      calc('9');
                    },
                    child: const Text(
                      '9',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      calc('/');
                    },
                    child: const Text(
                      '/',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      calc('4');
                    },
                    child: const Text(
                      '4',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      calc('5');
                    },
                    child: const Text(
                      '5',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      calc('6');
                    },
                    child: const Text(
                      '6',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      calc('x');
                    },
                    child: const Text(
                      'x',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      calc('1');
                    },
                    child: const Text(
                      '1',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      calc('2');
                    },
                    child: const Text(
                      '2',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      calc('3');
                    },
                    child: const Text(
                      '3',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      calc('-');
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      calc('0');
                    },
                    child: const Text(
                      '0',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      calc(',');
                    },
                    child: const Text(
                      ',',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      calc('=');
                    },
                    child: const Text(
                      '=',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      calc('+');
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
