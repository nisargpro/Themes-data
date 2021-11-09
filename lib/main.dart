import 'package:flutter/material.dart';
import 'package:themes/home.dart';

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: Colors.amberAccent,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.red,
    backgroundColor: Colors.amber,
    textTheme: _appTextTheme(base.textTheme)
  );
}

TextTheme _appTextTheme(TextTheme base){
  return base.copyWith(
    headline: base.headline!.copyWith(
      fontWeight: FontWeight.w500,
    ),

    title: base.title!.copyWith(
      fontSize: 18.0,
    ),
    caption: base.caption!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14
    ),
    button: base.button!.copyWith(
      letterSpacing: 3.0,
      fontFamily: "PermanentMarker"
    ),

    body1: base.body1!.copyWith(
       fontSize: 15.9,
      fontFamily: "PermanentMarker",
    )
  ).apply(
    fontFamily: "PermanentMarker",
    decorationColor: Colors.green,
    bodyColor: Colors.white
  );
}

void main() => runApp(new MaterialApp(
  theme: _appTheme,
  // theme: ThemeData(
  //   brightness: Brightness.dark,
  //   primaryColor: Colors.grey[900],
  //   textTheme: TextTheme(
  //     headline: TextStyle(
  //       fontSize: 34,
  //       fontWeight: FontWeight.bold
  //     ),
  //     body1: TextStyle(
  //       fontSize: 16.9,
  //       color: Colors.white
  //     )
  //   )
  // ),
  home: QuizApp(),
));