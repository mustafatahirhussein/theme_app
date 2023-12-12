import 'package:flutter/material.dart';

extension MQExtension on BuildContext {

  double get allHeight => MediaQuery.of(this).size.height;
  double get allWidth => MediaQuery.of(this).size.width;
}