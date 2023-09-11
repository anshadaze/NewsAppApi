import 'package:flutter/material.dart';
import 'package:newsapp/models/articleModel/article_model.dart';
import 'package:newsapp/services/categorynews_services.dart';
import 'package:newsapp/services/news_services.dart';

class NewsProvider extends ChangeNotifier {
  List<ArticleModel> articles = <ArticleModel>[];


  void getAllNews() async {
    articles = await NewsServices().getNews();
    notifyListeners();
  }

  void getAllCategoryNews(String category) async{
    // CategoryNewsServices categoryNews = CategoryNewsServices();
    articles = await CategoryNewsServices().getCategoryNews(category);
    notifyListeners();
  }
}