import 'package:flutter/material.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context)=>ThemeData(
      primarySwatch: Colors.blue,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black), toolbarTextStyle: Theme.of(context).textTheme.bodyText2, titleTextStyle: Theme.of(context).textTheme.headline6,
      )
    //fontFamily: GoogleFonts.lato().fontFamily
  );

  static ThemeData darkTheme(BuildContext context)=>ThemeData(
      brightness: Brightness.light
  );
}