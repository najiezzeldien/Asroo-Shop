import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  TextUtils({
    Key? key,
    required this.text,
    required this.fontsize,
    required this.fontWeight,
    required this.color,
    required this.underLine,
  }) : super(key: key);
  final String text;
  final double fontsize;
  final Color color;
  final FontWeight fontWeight;
  final TextDecoration underLine;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          //overflow: TextOverflow.ellipsis,
          decoration: underLine,
          color: color,
          fontSize: fontsize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
