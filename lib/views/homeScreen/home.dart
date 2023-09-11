import 'package:flutter/material.dart';
import 'package:newsapp/controller/news_provider.dart';
import 'package:newsapp/helper/categories.dart';
import 'package:newsapp/views/homeScreen/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).getAllNews();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'News',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'Net',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          elevation: 0,
        ),
        body: Consumer<NewsProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    //categories
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),

                    //Blogs
                    SizedBox(
                      child: ListView.builder(
                          itemCount: provider.articles.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: provider.articles[index].urlToImage,
                              title: provider.articles[index].title,
                              desc: provider.articles[index].description,
                              Url: provider.articles[index].url,
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
