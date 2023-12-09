import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 81));
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Color.fromARGB(255, 5, 99, 125));
void main() {
  runApp(MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kDarkColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor:
                kDarkColorScheme.primaryContainer.withOpacity(0.25),
            foregroundColor: kDarkColorScheme.secondaryContainer,
            titleTextStyle: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            iconTheme: IconThemeData(color: kDarkColorScheme.secondary),
          ),
          iconTheme:
              IconThemeData(color: kDarkColorScheme.onSecondaryContainer),
          cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      kDarkColorScheme.onSecondary.withOpacity(1))),
          snackBarTheme: const SnackBarThemeData().copyWith(
              backgroundColor: kDarkColorScheme.secondaryContainer,
              actionTextColor: Colors.white,
              actionBackgroundColor: kColorScheme.error.withOpacity(0.4)),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  color: kDarkColorScheme.onSecondaryContainer,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                titleSmall: TextStyle(
                  color: kDarkColorScheme.onSecondaryContainer,
                  //fontSize: 16,
                  //fontWeight: FontWeight.bold,
                ),
              )),
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.onSecondaryContainer,
            titleTextStyle: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            iconTheme: IconThemeData(color: kColorScheme.inversePrimary),
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kColorScheme.primaryContainer)),
          snackBarTheme: const SnackBarThemeData().copyWith(
              backgroundColor: kColorScheme.secondaryContainer,
              actionBackgroundColor: kColorScheme.onSecondaryContainer),
          textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ))),
      home: const Expenses() //Add main widget,
      ));
}
