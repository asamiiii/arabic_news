import 'package:arabic_news/network/remote/api_manager.dart';
import 'package:arabic_news/providers/articles_provider.dart';
import 'package:arabic_news/screens/home_layout/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data_model/news.dart';
import '../../data_model/sources.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ArticleProvider>(context);
    
    
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60), child: MainAppBar()),
        body: Stack(children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          FutureBuilder(
            future:Future.wait([ApiManager.getSources(),ApiManager.getArticleBySources('cnn')]) ,
            builder: (context, snapshot) {
               List<Sources>? sources = snapshot.data![0] as List<Sources>?;
               List<Articles>? news = snapshot.data![1]  as List<Articles>  ;
               
              return Column(
                children: [
                   SourcesTabs(sources),
                   Expanded(child: ListOfArticles(news))
                ],
              ) ;
            },
          ),
        /* FutureBuilder(
            
              future: ApiManager.getArticleBySources('cnn'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  const Center(child: CircularProgressIndicator());
                } else if (myProvider.sourcess!.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                var news = snapshot.data ?? [];
                return ListOfArticles(news);
              })*/
        ]));
  }
}
