import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  String text;

  ResultDisplay({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      color: Colors.black,
      child: Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.only(right: 24,bottom: 24),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 34),
        ),
      ),
    );
  }
}
