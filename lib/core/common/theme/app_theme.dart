import 'package:daily_scrum/core/common/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // static ThemeData get theme {
  //   return ThemeData(
  //       primaryColor: ColorsTheme.primaryVariantColorDark,
  //       scaffoldBackgroundColor: ColorsTheme.secondaryColor,
  //       appBarTheme: const AppBarTheme(
  //         elevation: 0,
  //         centerTitle: true,
  //         color: ColorsTheme.primaryVariantColorDark,
  //         iconTheme: IconThemeData(color: Colors.white),
  //       ),
  //       textTheme: const TextTheme(
  //         headline1: TextStyle(color: Colors.black, fontSize: 96),
  //         headline2: TextStyle(color: Colors.black, fontSize: 60),
  //         headline3: TextStyle(color: Colors.black, fontSize: 48),
  //         headline4: TextStyle(color: Colors.black, fontSize: 34),
  //         headline5: TextStyle(color: Colors.black, fontSize: 24),
  //         headline6: TextStyle(color: Colors.black, fontSize: 20),
  //         subtitle1: TextStyle(color: Colors.white, fontSize: 16),
  //         subtitle2: TextStyle(color: Colors.white, fontSize: 14),
  //         bodyText1: TextStyle(color: Colors.black, fontSize: 16),
  //         bodyText2: TextStyle(color: Colors.black, fontSize: 14),
  //         button: TextStyle(color: Colors.black, fontSize: 14),
  //         caption: TextStyle(color: Colors.black, fontSize: 12),
  //         overline: TextStyle(color: Colors.black, fontSize: 10),
  //       ),
  //       buttonTheme: ButtonThemeData(
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
  //         buttonColor: ColorsTheme.primaryVariantColorDark,
  //       ));
  // }
  static ThemeData get lightTheme {
    return ThemeData(
        colorScheme: const ColorScheme(
          primary: ColorsTheme.secondaryColor,
          primaryVariant: ColorsTheme.primaryVariantColorLight,
          secondary: ColorsTheme.secondaryColor,
          secondaryVariant: ColorsTheme.secondaryVariantColorLight,
          surface: Colors.red,
          background: ColorsTheme.backgroundColorLight,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: ColorsTheme.secondaryVariantColorLight,
          onBackground: ColorsTheme.backgroundColorLight,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(color: ColorsTheme.textColorLigth, fontSize: 96),
          headline2: TextStyle(color: ColorsTheme.textColorLigth, fontSize: 60),
          headline3: TextStyle(color: ColorsTheme.textColorLigth, fontSize: 48),
          headline4: TextStyle(color: ColorsTheme.textColorLigth, fontSize: 34),
          headline5: TextStyle(color: ColorsTheme.textColorLigth, fontSize: 24),
          headline6: TextStyle(color: ColorsTheme.textColorLigth, fontSize: 20),
          subtitle1: TextStyle(color: ColorsTheme.textColorLigth, fontSize: 16),
          subtitle2: TextStyle(color: ColorsTheme.textColorLigth, fontSize: 14),
          bodyText1: TextStyle(color: ColorsTheme.textColorLigth, fontSize: 16),
          bodyText2: TextStyle(color: ColorsTheme.textColorLigth, fontSize: 14),
          button: TextStyle(color: ColorsTheme.textColorLigth, fontSize: 14),
          caption: TextStyle(color: ColorsTheme.textColorLigth, fontSize: 12),
          overline: TextStyle(color: ColorsTheme.textColorLigth, fontSize: 10),
        ),
        scaffoldBackgroundColor: ColorsTheme.backgroundColorLight,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          color: ColorsTheme.primaryVariantColorLight,
          titleTextStyle: TextStyle(
              color: ColorsTheme.textColorLigth,
              fontWeight: FontWeight.bold,
              fontSize: 18),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        fontFamily: 'Montserrat',
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: ColorsTheme.button,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        colorScheme: const ColorScheme(
          primary: ColorsTheme.secondaryColor,
          primaryVariant: ColorsTheme.primaryVariantColorDark,
          secondary: ColorsTheme.secondaryColor,
          secondaryVariant: ColorsTheme.secondaryVariantColorDark,
          surface: Colors.red,
          background: ColorsTheme.backgroundColorDark,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: ColorsTheme.primaryVariantColorLight,
          onBackground: ColorsTheme.backgroundColorDark,
          onError: Colors.white,
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(color: ColorsTheme.textColorDark, fontSize: 96),
          headline2: TextStyle(color: ColorsTheme.textColorDark, fontSize: 60),
          headline3: TextStyle(color: ColorsTheme.textColorDark, fontSize: 48),
          headline4: TextStyle(color: ColorsTheme.textColorDark, fontSize: 34),
          headline5: TextStyle(color: ColorsTheme.textColorDark, fontSize: 24),
          headline6: TextStyle(color: ColorsTheme.textColorDark, fontSize: 20),
          subtitle1: TextStyle(color: ColorsTheme.textColorDark, fontSize: 16),
          subtitle2: TextStyle(color: ColorsTheme.textColorDark, fontSize: 14),
          bodyText1: TextStyle(color: ColorsTheme.textColorDark, fontSize: 16),
          bodyText2: TextStyle(color: ColorsTheme.textColorDark, fontSize: 14),
          button: TextStyle(color: ColorsTheme.textColorDark, fontSize: 14),
          caption: TextStyle(color: ColorsTheme.textColorDark, fontSize: 12),
          overline: TextStyle(color: ColorsTheme.textColorDark, fontSize: 10),
        ),
        scaffoldBackgroundColor: ColorsTheme.backgroundColorDark,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          color: ColorsTheme.primaryVariantColorDark,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        fontFamily: 'Montserrat',
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: ColorsTheme.button,
        ));
  }
}
