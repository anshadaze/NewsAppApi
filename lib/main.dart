import 'package:flutter/material.dart';
import 'package:newsapp/controller/newsProvider.dart';
import 'package:newsapp/views/homeScreen/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white
        ),
        home: const HomeScreen(),
      ),
    ); 
  }
}

