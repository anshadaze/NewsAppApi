

import 'package:flutter/material.dart';
import 'package:newsapp/controller/newsProvider.dart';
import 'package:newsapp/helper/categories.dart';
import 'package:newsapp/services/news.dart';
import 'package:newsapp/models/articleModel/articleModel.dart';
import 'package:newsapp/models/categoryModel/categoryModel.dart';
import 'package:newsapp/views/homeScreen/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ArticleModel>articles=<ArticleModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
}
  getNews()async{
    News newsClass=News();
    await newsClass.getNews();
    articles=newsClass.news;
    Provider.of<NewsProvider>(context,listen: false).changeLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('News',style: TextStyle(color: Colors.black),),
            Text(
              'Net',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        elevation: 0,
        ),
        body: Consumer<NewsProvider>(
          builder: (context, value, child) {
            return value.loading?Center( 
            child: Container(
              child: CircularProgressIndicator(),
            ),
          ):SingleChildScrollView(
             child: Container(
               padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
           
                  //categories
                  Container(
                   
                    height: 70,
                    child: ListView.builder(
                      itemCount: categories.length,
                      shrinkWrap: true, 
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(context,index){
                        return CategoryTile(
                           imageUrl: categories[index].imageUrl,
                           categoryName: categories[index].categoryName,
                        );
                      } ),
                  ),
           
                  //Blogs
                  Container(
                    child: ListView.builder(
                      itemCount: articles.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder:(context,index){
                        return BlogTile(
                          imageUrl:articles[index].urlToImage, 
                          title:articles[index].title,
                           desc:articles[index].description,
                           Url: articles[index].url,
                           );
                           
                      }),
                  )
                ],
              ),
                 ),
           );
          },
          
        ),
    
      ),
    );
  }
}
