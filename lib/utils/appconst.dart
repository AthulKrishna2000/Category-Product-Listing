import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

TextStyle appstyle(double size, Color color, FontWeight fw) {
  return GoogleFonts.poppins(fontSize: size, color: color, fontWeight: fw);
}

TextStyle appstylewithHT(double size, Color color, FontWeight fw, double ht) {
  return GoogleFonts.poppins(
      fontSize: size, color: color, fontWeight: fw, height: ht);
}

class AppConstant {
  static const appMainbackColor = Color.fromARGB(255, 223, 221, 205);
  static const appMainconttainerColor = Colors.white;
  static const appMainColor = Color.fromARGB(255, 8, 191, 176);
  static const appSecendoryColor = Color.fromARGB(255, 53, 141, 122);
  static const apptextColor = Colors.black; //Color(0xFFFBF5F4);
  static const appStatusColor = Color(0xFFFBF5F4);
  static const iconcolor = Colors.black;
}
