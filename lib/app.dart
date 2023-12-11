import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/utils/app_theme.dart';
import 'package:wallpaper_app/utils/app_utils.dart';
import 'package:wallpaper_app/view_models/wallpaper_view_model.dart';
import 'package:wallpaper_app/views/wallpapers_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WallpaperViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: AppUtils.showBanner,
        theme: AppTheme.theme,
        title: AppUtils.title,
        home: WallpapersView(),
      ),
    );
  }
}
