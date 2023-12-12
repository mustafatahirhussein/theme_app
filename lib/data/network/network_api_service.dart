import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wallpaper_app/data/app_exceptions.dart';
import 'package:wallpaper_app/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/utils/app_utils.dart';

String baseUrl = "${dotenv.get('API_URL')}${dotenv.get('CURATED')}";

class NetworkApiService extends BaseApiService {

  @override
  dynamic getApiResponse() async {
    dynamic jsonResponse;

    http.Response res = await http.get(Uri.parse('$baseUrl?per_page=${AppUtils.perPageCount}'), headers: {
      "Authorization": dotenv.get('ACCESS_TOKEN')
    });
    jsonResponse = await jsonOutput(res);

    return jsonResponse;
  }

  dynamic jsonOutput(http.Response response) {
    switch(response.statusCode) {
      case 200:
        dynamic res = jsonDecode(response.body);
        return res;
      case 500:
        throw FetchDataException("Internal server error ${response.body}");
      default:
        throw BadRequestException("Bad request ${response.body}");
    }
  }
}