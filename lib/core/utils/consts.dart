// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

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

const materialColor = MaterialColor(0xFFF9A825, <int, Color>{
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

const List<String> _pocketTitles = [
  "یک روزه، یک آگهی",
  "هفت روزه، سه آگهی",
  "یک ماهه، ده آگهی",
  "سه ماهه، پنجاه آگهی",
  "شش ماهه، صدوبیست آگهی",
  "یک روزه ويژه، یک آگهی",
  "هفت روزه ويژه، دو آگهی",
  "یک ماهه ويژه، پنج آگهی",
  "سه ماهه ويژه، پانزده آگهی",
  "شش ماهه ويژه، سی آگهی"
];

List<String> get pocketTitles => _pocketTitles;

const List<String> _pocketStatus = [
  "پیش نمایش",
  "فعال",
  "تمام شده",
];

List<String> get pocketStatuses => _pocketStatus;

const List<String> _offerTypesTitle = ["معمولی", "ویژه"];

List<String> get offerTypesTitle => _offerTypesTitle;

final List<DropdownMenuItem<String>> offerTypes = [
  DropdownMenuItem(child: Text(offerTypesTitle[0]), value: "0"),
  DropdownMenuItem(child: Text(offerTypesTitle[1]), value: "1"),
];

const List<String> _offerStatusTitle = ["پیش نمایش", "انتشار"];

List<String> get offerStatusTitle => _offerStatusTitle;

const List<String> _reserveStatusTitle = [
  "تحویل داده نشده",
  "تحویل داده شده",
  "لغو شده",
];

List<String> get reserveStatusTitle => _reserveStatusTitle;

final List<DropdownMenuItem<String>> offerStatus = [
  DropdownMenuItem(child: Text(offerStatusTitle[0]), value: "0"),
  DropdownMenuItem(child: Text(offerStatusTitle[1]), value: "1"),
];

void showErrorSnackbar(String message) {
  Get.snackbar(
    'خطا',
    message,
    backgroundColor: Colors.red.shade700,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 1),
  );
}

void showGreenSnackbar(String message) {
  Get.snackbar('موفق', message,
      backgroundColor: Colors.green.shade700,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM);
}
