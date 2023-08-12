import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapp/views/homeScreen/home.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ArticleView extends StatefulWidget {
  final blogUrl;
 
  const ArticleView({super.key,
  this.blogUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  final Completer<WebViewController>_completer=Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: Container(
          child:WebView(
            initialUrl:widget.blogUrl,
            onWebViewCreated: ((WebViewController webViewController){
              _completer.complete(webViewController);
            }),
          )
        ),
      ),
    );
  }
}

