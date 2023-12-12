import 'package:flutter/material.dart';
import 'package:wallpaper_app/utils/navigation_service/app_navigation_service.dart';
import 'package:wallpaper_app/views/wallpapers_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    // TODO: implement initState
    router();
    super.initState();
  }

  router() {
    Future.delayed(Duration(seconds: 2), () => AppNavigationService().navigateAndRemoveUntil(WallpapersView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 150,
            ),

            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
