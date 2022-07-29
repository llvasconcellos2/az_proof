import 'package:flutter/material.dart';

class AzColors {
  static const lightRed = Color(0xFFFE877A);
  static const red = Color(0xFFFE7C6E);
  static const deepRed = Color(0xFFE30F0F);
  static const whiteSmoke = Color(0xFFF5F5F5);
  static const whiteGray = Color(0xFFE6E6E6);
  static const blueGray = Color(0xFF97A1A8);
  static const gray = Color(0xFF97A1A8);
  static const deepBlueGray = Color(0xFF59666F);
  static const orange = Color(0xFFFBB03B);
  static const lightPink = Color(0xFFF4C8E1);
  static const lightGreen = Color(0xFFB6EEDD);
  static const lightCyan = Color(0xFFC3E7F3);
  static const violet = Color(0xFF8F95B2);
}

class AzTypography {
  static TextStyle nunito = const TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static TextStyle nunitoBlueGray = nunito.copyWith(
    color: AzColors.blueGray,
  );

  static TextStyle nunitodeepBlueGray = nunito.copyWith(
    color: AzColors.deepBlueGray,
  );
}
