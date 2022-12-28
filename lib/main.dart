import 'package:arabic_news/screens/home_layout/home_Layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //drawerTheme:const DrawerThemeData(scrimColor:Colors.black ) ,
        primarySwatch: Colors.blue,
      ),
      home: const  HomeLayout(),
    );
  }
}






