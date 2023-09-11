import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/articleModel/article_model.dart';

class NewsServices {
  List<ArticleModel> news = [];
  Future<List<ArticleModel>> getNews() async {
    try {
      String url =
          'https://newsapi.org/v2/top-headlines?country=in&apiKey=9a922478bde34c1298d3aba0b7a4f66d';

      var response = await http.get(Uri.parse(url));

      var jsonData = jsonDecode(response.body);
      final articleList = (jsonData["articles"] as List).map((e) {
        return ArticleModel.fromJson(e as Map<String, dynamic>);
      }).toList();

      return articleList;
    } catch (e) {
      return [];
    }
  }
}


