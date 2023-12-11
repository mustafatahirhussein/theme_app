import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wallpaper_app/data/response/api_response.dart';
import 'package:wallpaper_app/models/wallpapers_model.dart';
import 'package:wallpaper_app/repository/wallpaper_repository.dart';

class WallpaperViewModel extends ChangeNotifier {
  final WallpaperRepository repository = WallpaperRepository();
  bool loading = false;

  BehaviorSubject<List<Photos>> wallpaper$ = BehaviorSubject();

  getWallpapers() async {
    loading = true;
    notifyListeners();

    dynamic res = await repository.getWallpapers();
    WallpaperModel model = WallpaperModel.fromJson(res);
    wallpaper$.sink.add(model.photos);;

    loading = false;
    notifyListeners();
  }
}