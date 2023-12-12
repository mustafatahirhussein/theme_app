import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/utils/navigation_service/app_navigation_service.dart';
import 'package:wallpaper_app/views/general/about_us.dart';
import 'package:wallpaper_app/views/widgets/drawer_content_view.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: Drawer(
        child: ListView(
          shrinkWrap: true,
          children: [
            FlutterLogo(
              curve: Curves.decelerate,
              size: 150,
            ),
            DrawerContentView(
              icon: FluentIcons.home_12_filled,
              title: 'Home',
              onTap: () => AppNavigationService().pop(),
            ),
            DrawerContentView(
              icon: FluentIcons.organization_12_filled,
              title: 'About Us',
              onTap: () {
                AppNavigationService().pop();
                AppNavigationService().navigate(AboutUs());
              },
            ),
            DrawerContentView(
              icon: FluentIcons.contract_down_left_16_filled,
              title: 'Privacy Policy',
              onTap: () {
                AppNavigationService().pop();
                AppNavigationService().navigate(AboutUs());
              },
            ),
            DrawerContentView(
              icon: FluentIcons.arrow_exit_20_filled,
              title: 'Exit App',
              onTap: () {
                AppNavigationService().pop();
                exit(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
