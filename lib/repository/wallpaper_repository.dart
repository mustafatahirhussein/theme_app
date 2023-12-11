import 'package:wallpaper_app/data/network/network_api_service.dart';

class WallpaperRepository {
  final NetworkApiService apiService = NetworkApiService();

  dynamic getWallpapers() async {
    dynamic res = await apiService.getApiResponse();
    return res;
  }
}