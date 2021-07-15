import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int textColor;
  final int fillColor;
  final double textSize;
  final Function callback;
  CalcButton(
      {this.text,
      this.textColor = 0xffffffff,
      this.fillColor,
      this.textSize = 28,
      this.callback});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10.0),
      child: SizedBox(
        height: height * 0.09,
        width: height * 0.09,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                fillColor != null ? Color(fillColor) : null),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                //side: BorderSide(color: Colors.amber),
              ),
            ),
          ),
          onPressed: () {
            callback(text);
          },
          child: Text(
            text,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(
              fontSize: textSize,
              color: Color(textColor),
            )),
          ),
        ),
      ),
    );
  }
}
