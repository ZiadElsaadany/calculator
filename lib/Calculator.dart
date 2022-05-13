import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CalcultorButton.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = "";
  Color colors1 = Colors.black ;
  Color colors2 = Colors.white ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Calculator"),
        brightness: Brightness.dark,
      ),
      body:   Column(
        children: [
          Expanded(
          flex: 4,
           child: Row(
            children: [
              Text("${result==""?'0.0':result}",style: TextStyle(
                fontSize: 30.0,
              ), ),
            ],
          )),
          Expanded(
            flex: 2,
            child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(

                    width: 90.0,
                    child: CalculatorButton("AC" , clear, Colors.white70.withOpacity(0.1) ,Colors.teal.withOpacity(0.6))),
                Spacer(),
                Container(

                    width: 90.0,
                    child: CalculatorButton("X" , delete, Colors.white70.withOpacity(0.1) ,Colors.red.withOpacity(0.5))),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton("7" , onDigitClicked,colors1,colors2),
                CalculatorButton("8" , onDigitClicked,colors1,colors2),
                CalculatorButton("9",  onDigitClicked,colors1,colors2),
                CalculatorButton("+" , onOperatorClicked,Colors.white70,Colors.blueAccent),

              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton("4" , onDigitClicked,colors1,colors2),
                CalculatorButton("5" , onDigitClicked,colors1,colors2),
                CalculatorButton("6",onDigitClicked,colors1,colors2),
                CalculatorButton("-" , onOperatorClicked,Colors.white70,Colors.blueAccent),

              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton("1" , onDigitClicked,colors1,colors2),
                CalculatorButton("2" , onDigitClicked,colors1,colors2),
                CalculatorButton("3",onDigitClicked,colors1,colors2),
                CalculatorButton("*" , onOperatorClicked,Colors.white70,Colors.blueAccent),

              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton("." , onDigitClicked,colors1,colors2),
                CalculatorButton("0" , onDigitClicked,colors1,colors2),
                CalculatorButton("=",  onEqualClicked,Colors.white70,Colors.blueAccent),
                CalculatorButton("/" , onOperatorClicked,Colors.white70,Colors.blueAccent),

              ],
            ),
          ),
        ],
      ),
    );
  }

 String lhs = '';
  String operator ='';
  void onDigitClicked(String digit){
      result+=digit ;
      setState(() {});
  }
  void onOperatorClicked(String operatorClicked){
      if(lhs.isEmpty){
        lhs= result ;
      }else{
        String rhs= result ;
        lhs = calculate(lhs, operator, rhs).toString();
      }
      result ='';
      operator= operatorClicked ;
      setState(() {});
  }
  double ? calculate(String lhs ,String operator ,String rhs){
       double lhsAsDouble = double.parse(lhs);
       double rhsAsDouble = double.parse(rhs);
       if(operator == '+')
        return lhsAsDouble+ rhsAsDouble ;
       else if(operator == '-')
         return lhsAsDouble - rhsAsDouble ;
       else if(operator == '*')
         return lhsAsDouble * rhsAsDouble ;
       else if(operator == '/')
         return lhsAsDouble / rhsAsDouble ;
  }
  void onEqualClicked(){
       if(lhs.isEmpty || result.isEmpty || operator.isEmpty) return;
       result = calculate(lhs, operator, result).toString() ;
       lhs='';
       setState(() {});
  }
  void clear(){
    lhs= '';
    result='';
    operator='';
    setState(() {});
  }
  void delete(){
    double result2 = double.parse(result);
    result2 -=result2%10 ;
    result = result2.toString();
    setState(() {});
  }
}
