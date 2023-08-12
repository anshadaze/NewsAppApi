import 'package:flutter/material.dart';
import 'package:newsapp/helper/news.dart';
import 'package:newsapp/views/homeScreen/home.dart';
import 'package:newsapp/views/homeScreen/widgets.dart';

import '../models/articleModel/articleModel.dart';

class CateogryNews extends StatefulWidget {
  final category;
  const CateogryNews({super.key,
  this.category});
  
  @override
  State<CateogryNews> createState() => _CateogryNewsState();
}

class _CateogryNewsState extends State<CateogryNews> {
   List<ArticleModel>articles=<ArticleModel>[];
  bool _loading=true;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

    getCategoryNews()async{
    CategoryNewsClass newsClass=CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles=newsClass.news;
    setState(() {
      _loading=false;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop(MaterialPageRoute(builder: (context) => HomeScreen(),));
          }, icon:Icon(Icons.arrow_back,color: Colors.black,)),
            backgroundColor: Colors.white,
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text('News',style: TextStyle(color: Colors.black),),
              Text(
                'Net',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        actions: [
          Opacity(opacity: 0,
          child: Container(
            child: Icon(Icons.abc),
          ),)
        ],
         
          elevation: 0,
          ),
          body: _loading?Center( 
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ): SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
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
                  ),
                ],
              ),
            ),
        )     //Blogs
              
    );
  }
}