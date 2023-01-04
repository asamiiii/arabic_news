import 'package:arabic_news/network/remote/api_manager.dart';
import 'package:arabic_news/providers/articles_provider.dart';
import 'package:arabic_news/screens/home_layout/home_Layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  //ApiManager.getSources();
  //ApiManager.getArticleBySources('cnn');
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ArticleProvider()),
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ArticleProvider(),
        child: Consumer<ArticleProvider>(
            builder: (context, value, child) => MaterialApp(
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    //drawerTheme:const DrawerThemeData(scrimColor:Colors.black ) ,
                    primarySwatch: Colors.blue,
                  ),
                  home: const HomeLayout(),
                )));
  }
}
