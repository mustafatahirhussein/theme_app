import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wallpaper_app/models/wallpapers_model.dart';
import 'package:wallpaper_app/utils/navigation_service/app_navigation_service.dart';
import 'package:wallpaper_app/views/widgets/circular_secondary_loader.dart';
import 'package:wallpaper_app/views/widgets/wallpaper_fullscreen_view.dart';

class WallpaperCustomView extends StatefulWidget {
  const WallpaperCustomView({super.key, required this.item,});

  final Photos item;

  @override
  State<WallpaperCustomView> createState() => _WallpaperCustomViewState();
}

class _WallpaperCustomViewState extends State<WallpaperCustomView> {

  InterstitialAd? _speakModeInterstitialAdId;

  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/4411468910';

  // TODO: Implement _loadInterstitialAd()
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              AppNavigationService().navigate(WallpaperFullscreenView(item: widget.item));
            },
          );

          setState(() {
            _speakModeInterstitialAdId = ad;
          });
        },
        onAdFailedToLoad: (err) {
          debugPrint('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    _loadInterstitialAd();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    if (!mounted) {
      _speakModeInterstitialAdId!.dispose();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        if (_speakModeInterstitialAdId != null) {
          _speakModeInterstitialAdId!.show();
        }
      },
      child: CachedNetworkImage(
        imageUrl: widget.item.src.original,
        fit: BoxFit.cover,
        placeholder: (context, _) => CircularSecondaryLoader(),
      ),
    );
  }
}
