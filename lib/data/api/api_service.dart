import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/model/article.dart';

class ApiService{
  static final String _baseUrl = 'http://newsapi.org/v2/';
  static final String _apiKey = '9094ba21c74e472aabce0f3b7211d67a';
  static final String _category = 'technology';
  static final String _country = 'us';


  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(Uri.parse("${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    if (response.statusCode == 200){
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}