import 'dart:convert';
import 'package:arabic_news/data_model/news.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../data_model/sources.dart';

String apiKey = '86cfe7fdeddb4c48ac5c0de8495a5d77';
String baseUrl = 'newsapi.org';
List<Source> sourcesList=[] ;
List<Articles> newsList=[];

class ApiManager {
  static Future<List<Sources>?> getSources() async {
    Uri url =
        Uri.https(baseUrl, '/v2/top-headlines/sources', {'apiKey': apiKey});
    Response source = await http.get(url);
    var json = jsonDecode(source.body);
    print(source.body.toString());    
    Source sources = Source.fromJson(json);
    //sourcesList.add(sources);
    print(sourcesList);
    return sources.sources;
  }

    static Future<List<Articles>?> getArticleBySources(String sourceID) async {
    Uri url =
        Uri.https(baseUrl, '/v2/everything',
         {
          'apiKey': apiKey,
          'language':'ar',
          'sources':sourceID,
          });
    Response articles = await http.get(url);
    var json = jsonDecode(articles.body);
    print(articles.body.toString());       
    News article = News.fromJson(json);
    //newsList.add(article);
    return article.articles;
  }
}
