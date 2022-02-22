import 'package:daily_scrum/core/common/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
        primaryColor: ColorsTheme.primaryColor,
        scaffoldBackgroundColor: ColorsTheme.secondaryColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          color: ColorsTheme.primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.black, fontSize: 96),
          headline2: TextStyle(color: Colors.black, fontSize: 60),
          headline3: TextStyle(color: Colors.black, fontSize: 48),
          headline4: TextStyle(color: Colors.black, fontSize: 34),
          headline5: TextStyle(color: Colors.black, fontSize: 24),
          headline6: TextStyle(color: Colors.black, fontSize: 20),
          subtitle1: TextStyle(color: Colors.white, fontSize: 16),
          subtitle2: TextStyle(color: Colors.white, fontSize: 14),
          bodyText1: TextStyle(color: Colors.black, fontSize: 16),
          bodyText2: TextStyle(color: Colors.black, fontSize: 14),
          button: TextStyle(color: Colors.black, fontSize: 14),
          caption: TextStyle(color: Colors.black, fontSize: 12),
          overline: TextStyle(color: Colors.black, fontSize: 10),
        ),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: ColorsTheme.primaryColor,
        ));
  }

}
