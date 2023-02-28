import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/models/news_model.dart';
import 'package:http/http.dart' as http;

import '../models/category_model.dart';

final _URL_NEWS = 'newsapi.org';
final _APIKEY = '';

class NewsService extends ChangeNotifier {
  List<Article> headlines = [];

  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadLines();
    for (var element in categories) { 
      categoryArticles[element.name] = [];
    }
  }

  getTopHeadLines() async {
    final url = Uri.https(
        _URL_NEWS, 'v2/top-headlines', {'apiKey': _APIKEY, 'country': 'mx'});
    final response = await http.get(url);
    final newsResponse = NewsResponse.fromRawJson(response.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String value) {
    _selectedCategory = value;
    getArticlesByCategory(value);
    notifyListeners();
  }

  List<Article> get articlesByCategory => categoryArticles[selectedCategory]!;
  

  getArticlesByCategory(String category) async {

    if(categoryArticles[category]!.isNotEmpty){
      return;
    }
    final url = Uri.https(_URL_NEWS, 'v2/top-headlines', {
      'apiKey': _APIKEY,
      'country': 'mx',
      'category': category
    });
    final response = await http.get(url);
    final newsResponse = NewsResponse.fromRawJson(response.body);
    categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }
}
