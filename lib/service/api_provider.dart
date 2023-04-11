import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:grocery_app/modelclass/fetch_api_model.dart';


class ApiProvider {
  Future<FetchApiModel> getApi() async {
    final Dio _dio = Dio();
    const String url =
        "https://raw.githubusercontent.com/sayan-futurehook/test-api/main/test-notifications.json";
    Response response = await _dio.get(url);
    final decodedJson = json.decode(response.data); // decode the JSON string
    return FetchApiModel.fromJson(decodedJson); // parse the decoded JSON
  }
}