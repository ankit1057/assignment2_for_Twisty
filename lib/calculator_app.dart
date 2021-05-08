import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'calc.dart';
class CalculatorApp extends StatelessWidget {

  @override
  void initState(){
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Calculation(),
    );
  }
}

