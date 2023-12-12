import 'package:flutter/cupertino.dart';

class CircularFullCustomLoader extends StatelessWidget {
  const CircularFullCustomLoader({super.key, required this.child, required this.isEnabled,});

  final Widget child;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return isEnabled ? Center(child: CupertinoActivityIndicator()) : child;
  }
}
