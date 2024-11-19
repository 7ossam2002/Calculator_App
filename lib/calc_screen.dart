import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'calc_button.dart';

class CalcScreen extends StatefulWidget {
  String? textView='';
  static const String routeName = "/";

  CalcScreen({super.key, this.textView}); // Optional textView in constructor

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  String textView = '';

  @override
  void initState() {
    super.initState();
    textView = widget.textView ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
          backgroundColor: Colors.white12,
          title: Text(
            "Calculator",
            style: TextStyle(color: Colors.white,fontSize: 25),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh, color: Colors.white),
              onPressed: onReset,
              tooltip: 'Reset Calculator',
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(textView, style: TextStyle(color: Colors.white, fontSize: 45),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcButton(btnText: '7', OnButtonClicked: onListenButton),
                    CalcButton(btnText: '8', OnButtonClicked: onListenButton),
                    CalcButton(btnText: '9', OnButtonClicked: onListenButton),
                    CalcButton(btnText: '/', OnButtonClicked: onOperationClicked),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcButton(btnText: '4', OnButtonClicked: onListenButton),
                    CalcButton(btnText: '5', OnButtonClicked: onListenButton),
                    CalcButton(btnText: '6', OnButtonClicked: onListenButton),
                    CalcButton(btnText: '*', OnButtonClicked: onOperationClicked),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcButton(btnText: '1', OnButtonClicked: onListenButton),
                    CalcButton(btnText: '2', OnButtonClicked: onListenButton),
                    CalcButton(btnText: '3', OnButtonClicked: onListenButton),
                    CalcButton(btnText: '-', OnButtonClicked: onOperationClicked),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcButton(btnText: '.', OnButtonClicked: onListenButton),
                    CalcButton(btnText: '0', OnButtonClicked: onListenButton),
                    CalcButton(btnText: '+', OnButtonClicked: onOperationClicked),
                    CalcButton(btnText: '=', OnButtonClicked: onEqual),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onListenButton(String digit) {
    setState(() {
      textView += digit;
    });
  }

  String savedOp='';
  String savedNumber='';
  void onOperationClicked(String op){
if(savedNumber.isEmpty){
  savedNumber=textView;
  savedOp=op;

  setState(() {
    textView='';
  });
}else{
  String newNumber=textView;
  String res =calculate(savedOp,savedNumber,newNumber);
  savedNumber=res;
  savedOp=op;
  setState(() {
    textView ='';
  });
}
  }

  String calculate(String savedOp, String savedNumber, String newNumber) {
    double n1 =double.parse(savedNumber);
    double n2 =double.parse(newNumber);
    double res =0;
    if(savedOp=="+"){
     res= n1+n2;
    }
    else if(savedOp=="-"){
      res= n1-n2;
    }
    else if(savedOp=="*"){
      res= n1*n2;
    }
    else if(savedOp=="/"){
      res= n1/n2;
    }
    return res.toString();

  }
  void onEqual(String op){
    String newNumber=textView;
    String res =calculate(savedOp,savedNumber,newNumber);
    textView =res;
    savedNumber='';
    savedOp='';
    setState(() {

    });
}
  void onReset() {
    setState(() {
      textView = '';
      savedNumber = '';
      savedOp = '';
    });
  }

}
