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
          if (double.parse(screenAPP) * 1 == 0) {
            return;
          }
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

      case '<-':
        setState(() {
          screenAPP = screenAPP.substring(0, screenAPP.length - 1);
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
          /*appBar: AppBar(
            title: const Center(
              child: Text('Calculadora'),
            ),
          ),*/
          body: Column(
        /***************
             * screen
             * *************/
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Row(mainAxisAlignment: MainAxisAlignment.end),
          const Row(mainAxisAlignment: MainAxisAlignment.end),
          const Row(mainAxisAlignment: MainAxisAlignment.end),
          const Row(mainAxisAlignment: MainAxisAlignment.end),
          const Row(mainAxisAlignment: MainAxisAlignment.end),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                screenAPP,
                style: const TextStyle(fontSize: 70),
              ),
            ],
          ),
          const Row(mainAxisAlignment: MainAxisAlignment.end),
          const Row(mainAxisAlignment: MainAxisAlignment.end),
          const Row(mainAxisAlignment: MainAxisAlignment.end),

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
                  child: Image.asset('assets/images/buttonAC.png')),
              Image.asset('assets/images/buttonWhit.png'),
              Image.asset('assets/images/buttonWhit.png'),
              GestureDetector(
                onTap: () {
                  calc('<-');
                },
                child: Image.asset('assets/images/buttonBackspace.png'),
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
                  child: Image.asset('assets/images/button7.png')),
              GestureDetector(
                  onTap: () {
                    calc('8');
                  },
                  child: Image.asset('assets/images/button8.png')),
              GestureDetector(
                  onTap: () {
                    calc('9');
                  },
                  child: Image.asset('assets/images/button9.png')),
              GestureDetector(
                onTap: () {
                  calc('/');
                },
                child: Image.asset('assets/images/buttonDiv.png'),
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
                  child: Image.asset('assets/images/button4.png')),
              GestureDetector(
                  onTap: () {
                    calc('5');
                  },
                  child: Image.asset('assets/images/button5.png')),
              GestureDetector(
                  onTap: () {
                    calc('6');
                  },
                  child: Image.asset('assets/images/button6.png')),
              GestureDetector(
                onTap: () {
                  calc('x');
                },
                child: Image.asset('assets/images/buttonMul.png'),
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
                  child: Image.asset('assets/images/button1.png')),
              GestureDetector(
                  onTap: () {
                    calc('2');
                  },
                  child: Image.asset('assets/images/button2.png')),
              GestureDetector(
                  onTap: () {
                    calc('3');
                  },
                  child: Image.asset('assets/images/button3.png')),
              GestureDetector(
                  onTap: () {
                    calc('-');
                  },
                  child: Image.asset('assets/images/buttonSub.png')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    calc('0');
                  },
                  child: Image.asset('assets/images/button0.png')),
              GestureDetector(
                  onTap: () {
                    calc(',');
                  },
                  child: Image.asset('assets/images/buttonVir.png')),
              GestureDetector(
                  onTap: () {
                    calc('=');
                  },
                  child: Image.asset('assets/images/buttonEquals.png')),
              GestureDetector(
                  onTap: () {
                    calc('+');
                  },
                  child: Image.asset('assets/images/buttonPlus.png')),
            ],
          ),
        ],
      )),
    );
  }
}
