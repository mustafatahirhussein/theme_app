import 'package:flutter/cupertino.dart';

extension SizedBoxExtension<T> on num {

  SizedBox get height => SizedBox(height: toDouble(),);
  SizedBox get width => SizedBox(width: toDouble(),);
}