import 'dart:convert';

import 'package:bloc_pattern_best_code/constant/strings.dart';
import 'package:bloc_pattern_best_code/model/news_model.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class API_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get(Strings.news_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    // ignore: non_constant_identifier_names
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}
