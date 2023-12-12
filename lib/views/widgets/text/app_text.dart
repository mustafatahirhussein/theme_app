import 'package:flutter/material.dart';

class AppText extends Text {
  AppText.bold({super.key, required String text})
      : super(
          text,
          style: TextStyle(fontFamily: 'Ageo'),
        );
}
