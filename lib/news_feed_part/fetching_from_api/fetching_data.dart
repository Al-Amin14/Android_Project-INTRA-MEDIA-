import 'dart:convert';

import 'package:intra_media/news_feed_part/model/catagory_news_model.dart';
import 'package:intra_media/news_feed_part/model/news_catagory_model.dart';
import 'package:intra_media/news_feed_part/model/news_chanals.dart';
import 'package:http/http.dart' as http;

class fetching_data {
  Future<My_api_data_for_fetch> fetchNewChannelHeadlineApi(
      String news_keys) async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=${news_keys}&apiKey=29acaccb63994344b876333789637b7e';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return My_api_data_for_fetch.fromJson(body);
    }
    throw Exception('Error');
  }
  Future<NewsCatagoryModel> fetchNewsCatagoryModel(
      String catagory) async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=${catagory}&apiKey=29acaccb63994344b876333789637b7e';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsCatagoryModel.fromJson(body);
    }
    throw Exception('Error');
  }
  Future<CatagoryNewsModel> fetchNewsCatagory_of_individual_Model(
      String catagory) async {
    String url =
        'https://newsapi.org/v2/everything?q=${catagory}&apiKey=29acaccb63994344b876333789637b7e';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CatagoryNewsModel.fromJson(body);
    }
    throw Exception('Error');
  }
}
