import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  String? digit;
   Color  primaryColor = Colors.black;
   Color ? onPrimaryColor ;
  Function? onDigitClicked;

  CalculatorButton(this.digit, this.onDigitClicked ,this.primaryColor ,this.onPrimaryColor);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(4.0),
            child: ElevatedButton(
              onPressed: () {
                if (digit == '=') {
                  onDigitClicked!();
                } else if(digit == 'AC' || digit =='X'){
                  onDigitClicked!();
                }else
                  onDigitClicked!(digit);
              },
              child: Text(
                "$digit",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                onPrimary: onPrimaryColor,
              ),
            )));
  }
}
