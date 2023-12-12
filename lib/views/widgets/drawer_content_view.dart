import 'package:flutter/material.dart';
import 'package:wallpaper_app/utils/extensions/sizedbox_extensions.dart';
import 'package:wallpaper_app/views/widgets/text/app_text.dart';

class DrawerContentView extends StatelessWidget {
  const DrawerContentView({super.key, required this.title, required this.icon, required this.onTap,});

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.symmetric(
          vertical: 12
        ),
        child: Row(
          children: [
            Icon(icon),
            20.width,
            AppText.bold(text: title),
          ],
        ),
      ),
    );
  }
}
