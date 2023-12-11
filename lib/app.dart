import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wallpaper_app/utils/app_theme.dart';
import 'package:wallpaper_app/utils/app_utils.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: AppUtils.showBanner,
      theme: AppTheme.theme,
      title: AppUtils.title,
      home: Scaffold(
        body: Center(
          child: Text(dotenv.get('API_URL')),
        ),
      ),
    );
  }
}
