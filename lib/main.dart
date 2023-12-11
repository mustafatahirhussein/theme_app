import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wallpaper_app/app.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(MyApp());
}