import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:wallpaper_app/models/wallpapers_model.dart';
import 'package:wallpaper_app/utils/extensions/mq_extensions.dart';
import 'package:wallpaper_app/utils/extensions/sizedbox_extensions.dart';
import 'package:wallpaper_app/utils/navigation_service/app_navigation_service.dart';
import 'package:wallpaper_app/views/widgets/banner_ad_view.dart';
import 'package:wallpaper_app/views/widgets/circular_secondary_loader.dart';
import 'package:wallpaper_app/views/widgets/text/app_text.dart';

class WallpaperFullscreenView extends StatelessWidget {
  const WallpaperFullscreenView({super.key, required this.item,});

  final Photos item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            children: [

              CachedNetworkImage(
                imageUrl: item.src.original,
                imageBuilder: (context, _) {
                  return Image.network(item.src.original, fit: BoxFit.cover, height: 400, width: context.allWidth,);
                },
                placeholder: (context, _) => CircularSecondaryLoader(),
              ),

              Positioned.fill(
                top: 50,
                left: 10,
                child: InkWell(onTap: () => AppNavigationService().pop(),child: Align(child: Icon(FluentIcons.arrow_left_12_filled), alignment: Alignment.topLeft,)),
              ),

            ],
          ),

          6.height,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child:
              AppText.bold(
                text: "Image Source - Pexels",
              ),
            ),
          ),

          25.height,
          BannerAdView(),

          Spacer(),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(context.allWidth, 50)
            ),
            onPressed: () async {

              showModalBottomSheet(context: AppNavigationService.navigatorKey.currentContext!,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
              ),
              builder: (context) {
                return SizedBox(
                  height: context.allHeight * 0.20,
                  child: ApplyWallpaperSheet(),
                );
              },);

            },
            child: AppText.bold(text: 'Apply'),
          ),
        ],
      ),
    );
  }

  dynamic ApplyWallpaperSheet() {
    return ListView(
      shrinkWrap: true,
      children: [

        TextButton(
          child: AppText.bold(text: 'Apply as Home screen'),
          onPressed: () async {

            int location = WallpaperManager.HOME_SCREEN;
            File res = await DefaultCacheManager().getSingleFile(item.src.original);
            await WallpaperManager.setWallpaperFromFile(res.path, location);
          },
        ),

        TextButton(
          child: AppText.bold(text: 'Apply as Lock screen'),
          onPressed: () async {

            int location = WallpaperManager.LOCK_SCREEN;
            File res = await DefaultCacheManager().getSingleFile(item.src.original);
            await WallpaperManager.setWallpaperFromFile(res.path, location);
          },
        ),

        TextButton(
          child: AppText.bold(text: 'Apply Both as Default Wallpaper'),
          onPressed: () async {

            int location = WallpaperManager. BOTH_SCREEN;
            File res = await DefaultCacheManager().getSingleFile(item.src.original);
            await WallpaperManager.setWallpaperFromFile(res.path, location);
          },
        ),
      ],
    );
  }
}
