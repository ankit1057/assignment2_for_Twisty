import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  String label;
  VoidCallback OnTap;
  double size;
  Color backgroundColor;
  Color labelColor;

  CalculatorButton(
      {@required this.label,
      @required this.OnTap,
      @required this.size,
      this.backgroundColor = Colors.white,
      this.labelColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, offset: Offset(1, 1), blurRadius: 2),
            ],
            borderRadius: BorderRadius.all(Radius.circular(size / 2)),
            color: backgroundColor),
        child: InkWell(
            customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(size / 2))),
            onTap: OnTap,
            child: Center(
              child: Text(
                label,
                style: TextStyle(fontSize: 24, color: labelColor),
              ),
            )),
      ),
    );
  }
}
