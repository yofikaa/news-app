import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/model/article.dart';

class ApiService{
  static final String _baseUrl = 'https://newsapi.org/v2';
  static final String _apiKey = 'YOUR_API_KEY';
  static final String _category = 'business';
  static final String _country = 'id';


  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(Uri.parse(_baseUrl + "https://newsapi.org/v2/top-headlines?country=id&apiKey=9094ba21c74e472aabce0f3b7211d67a"));
    if (response.statusCode == 200){
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}