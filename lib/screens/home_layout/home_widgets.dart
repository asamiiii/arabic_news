import 'package:arabic_news/app_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
          child: const Text(
              'News App',
              maxLines: 1,
              softWrap: false)),
    );
  }
}
