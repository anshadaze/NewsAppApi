import 'package:flutter/material.dart';
import 'package:newsapp/controller/news_provider.dart';
import 'package:newsapp/views/homeScreen/home.dart';
import 'package:newsapp/views/homeScreen/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CateogryNews extends StatefulWidget {
  final category;
  const CateogryNews({super.key,
  this.category});
  
  @override
  State<CateogryNews> createState() => _CateogryNewsState();
}

class _CateogryNewsState extends State<CateogryNews> {

   @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false)
        .getAllCategoryNews(widget.category);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop(MaterialPageRoute(builder: (context) => HomeScreen(),));
          }, icon:const Icon(Icons.arrow_back,color: Colors.black,)),
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
        actions: const[
          Opacity(opacity: 0,
          child:SizedBox(
            child: Icon(Icons.abc),
          ),)
        ],
         
          elevation: 0,
          ),
       body:Consumer<NewsProvider>(
        builder: (context,provider, child) {
           if(provider.isLoading){
                return const Center(child: CircularProgressIndicator(),);
              }
          return  SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                      SizedBox(
                      child: ListView.builder(
                        itemCount:provider. articles.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder:(context,index){
                          return BlogTile(
                            imageUrl:provider. articles[index].urlToImage, 
                            title:provider. articles[index].title,
                             desc:provider. articles[index].description,
                             Url:provider. articles[index].url,
                             );
                             
                        }),
                    ),
                  ],
                ),
              ),
          );
        },
         
       )
              
    );
  }
}