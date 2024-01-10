import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Consts {
  static Color color1 = const Color.fromARGB(255, 0, 67, 2);
  static Color color2 = const Color(0xffEF791C);
  static Color color3 = const Color(0xff45AC39);

  static Widget akwabaText() => Text(
        'Akwaba !',
        style: GoogleFonts.dancingScript(
          fontSize: 30,
          height: .5,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );

  static Widget slogan() => Text(
        "La CAN de l'hospitalité !",
        style: GoogleFonts.lemon(fontSize: 18, color: Colors.white),
      );
}
