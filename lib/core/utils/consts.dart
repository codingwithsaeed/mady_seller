// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final themeData = ThemeData(
  primarySwatch: materialColor,
  appBarTheme: const AppBarTheme(
    shadowColor: Colors.black,
    centerTitle: true,
    titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'Vazir'),
  ),
  fontFamily: 'Vazir',
);

const materialColor = MaterialColor(0xFFFFA000, <int, Color>{
  50: Color.fromRGBO(255, 253, 231, 1),
  100: Color.fromRGBO(255, 249, 196, 1),
  200: Color.fromRGBO(255, 245, 157, 1),
  300: Color.fromRGBO(255, 241, 118, 1),
  400: Color.fromRGBO(255, 238, 88, 1),
  500: Color.fromRGBO(255, 235, 59, 1),
  600: Color.fromRGBO(253, 216, 53, 1),
  700: Color.fromRGBO(251, 192, 45, 1),
  800: Color.fromRGBO(249, 168, 37, 1),
  900: Color.fromRGBO(245, 127, 23, 1),
});

const localizationDelegate = [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

const _localUrl = 'http://192.168.1.2/mady/webservice_seller.php';
const _onlineUrl = 'https://codingwithsaeed.ir/api/mady/webservice_seller.php';
const _localCheckUrl = 'http://192.168.1.2/mady/check_online.php';
const _onlineCheckUrl = 'https://codingwithsaeed.ir/api/mady/check_online.php';
final currentDataUrl = Uri.parse(_localUrl);
final currentCheckUrl = Uri.parse(_localCheckUrl);
