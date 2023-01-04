import 'package:arabic_news/app_theme/theme.dart';
import 'package:arabic_news/data_model/news.dart';
import 'package:arabic_news/network/remote/api_manager.dart';
import 'package:arabic_news/providers/articles_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../data_model/sources.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    //var myProvider=Provider.of<AppProvider>(context);
    return AppBar(
      backgroundColor: mainGreenColor,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(40),
      )),
      automaticallyImplyLeading: true,
      flexibleSpace: Container(),
      title: Container(
          padding: const EdgeInsets.all(10),
          child: const Text('News App', maxLines: 1, softWrap: false)),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class SourcesTabs extends StatelessWidget {
  List<Sources>? sources;

  SourcesTabs(this.sources, {super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ArticleProvider>(context);
    return DefaultTabController(
      length: sources!.length,
      child: TabBar(
        onTap: (value) {
          myProvider.changeCurrentTabsIndex(value);
        },
        indicatorColor: Colors.transparent,
        labelPadding: const EdgeInsets.all(8),
        isScrollable: true,
        labelColor: Colors.amber,
        automaticIndicatorColorAdjustment: false,
        tabs: sources!
            .map((e) => Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.blue),
                child: Text(e.name ??'')))
            .toList(),
      ),
    );
  }
}

class ListOfArticles extends StatelessWidget {
  List<Articles> news;
  // List<Articles> articles;
  ListOfArticles(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      //shrinkWrap:true ,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(6),
          child: Image.network(
            news[index].urlToImage ??'',
            height: 200,
            width: MediaQuery.of(context).size.width * 0.90,
          ),
        );
      },
    );
  }
}
