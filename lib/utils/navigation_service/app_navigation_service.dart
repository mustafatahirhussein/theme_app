import 'package:flutter/material.dart';

class AppNavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  navigate(Widget route, {Object? arg}) {
    return navigatorKey.currentState!.push(MaterialPageRoute(builder: (_) => route));
  }

  navigateAndRemoveUntil(Widget route, {Object? arg}) {
    return navigatorKey.currentState!.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => route), (_) => false);
  }

  pop() {
    return navigatorKey.currentState!.pop();
  }
}