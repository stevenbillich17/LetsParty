import 'package:flutter/material.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';

const Color appYellow = Color(0xFFEA980B);
const Color appRed = Color(0xFFE15554);
const Color appBlue = Color(0xFF456EB8);
const Color appWhite = Color(0xFFF7F7F2);
const Color appBlack = Color(0xFF292929);

ThemeData appThemeData = ThemeData(
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(primary: appYellow, secondary: appWhite),
  primaryColor: appYellow,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    toolbarHeight: 80.0,
    elevation: 0.0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.roundedButtonCorners),
          ),
        ),
      ),
    ),
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: appYellow,
  ),
);
