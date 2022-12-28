import 'package:arabic_news/screens/home_layout/home_widgets.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    //backgroundColor: Colors.transparent,
    appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60), child: MainAppBar()),
    body: Stack(
      children:[
         Image.asset('assets/images/background.png',fit:BoxFit.cover,height:double.infinity,width:double.infinity,),
        const Center(child: Text('test')),
        
        ]) ,
    drawer: Drawer(
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
    ),
      
    );
  }
}
