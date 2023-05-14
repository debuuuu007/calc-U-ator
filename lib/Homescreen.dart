
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/components/Cbuttons.dart';
import 'package:calculator/components/constants.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  var userinput = '';
  var ans = '';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      SizedBox(height: 50,),
                      Align(
                        alignment:Alignment.centerRight,
                        child: Text(userinput.toString(),
                          style: TextStyle(fontSize: 25, color: Colors.white),),
                      ),
                      SizedBox(height: 30,),
                      Text(ans.toString(),
                          style: TextStyle(fontSize: 25, color: Colors.white))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Button(title: "AC", onPress: () {userinput = '';setState(() {});},),
                        Button(title: "+/-", onPress: () {userinput += '+/-';
                        setState(() {});}),
                        Button(title: "%", onPress: () {userinput += '%';
                        setState(() {});}),
                        Button(title: "/", color: orange, onPress: () {userinput += '/';
                        setState(() {});})

                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          title: "7", onPress: () {
                          userinput += '7';
                          setState(() {});
                        },),
                        Button(title: "8", onPress: () {
                          userinput += '8';
                          setState(() {});
                        }),
                        Button(title: "9", onPress: () {
                          userinput += '9';
                          setState(() {});
                        }),
                        Button(title: "*", color:orange, onPress: () {userinput+='*';setState(() {

                        });})

                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          title: "4", onPress: () {
                          userinput += '4';
                          setState(() {});
                        },),
                        Button(title: "5", onPress: () {
                          userinput += '5';
                          setState(() {});
                        }),
                        Button(title: "6", onPress: () {
                          userinput += '6';
                          setState(() {});
                        }),
                        Button(title: "-", color: orange, onPress: () {userinput += '-';
                        setState(() {});})

                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          title: "1", onPress: () {
                          userinput += '1';
                          setState(() {});
                        },),
                        Button(title: "2", onPress: () {
                          userinput += '2';
                          setState(() {});
                        }),
                        Button(title: "3", onPress: () {
                          userinput += '3';
                          setState(() {});
                        }),
                        Button(title: "+", color: orange, onPress: () {userinput += '+';
                        setState(() {});})

                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          title: "0", onPress: () {
                          userinput += '0';
                          setState(() {});
                        },),
                        Button(title: ".", onPress: () {
                          userinput += '.';
                          setState(() {});
                        }),
                        Button(title: "DEL", onPress: () {userinput = userinput.substring(0,userinput.length-1);
                        setState(() {});}),
                        Button(title: "=", color:orange, onPress: () {equalPress();setState(() {

                        });})

                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }





  //Code to calculate expressions written in string format
  //Need to add a dependency to use Parser class --> math_expression .

  void equalPress(){
  Parser p = Parser();
  Expression expression=p.parse(userinput);
  ContextModel contextModel=ContextModel();
  double eval=expression.evaluate(EvaluationType.REAL, ContextModel());
  ans= eval.toString();
  }

  }




