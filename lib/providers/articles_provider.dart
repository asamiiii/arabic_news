import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../data_model/sources.dart';



class ArticleProvider extends ChangeNotifier {
  int curentTabsIndex = 0;
  List<Sources>? sourcess=[] ;


  changeCurrentTabsIndex(int value){
   curentTabsIndex = value;
   notifyListeners();
  }
}
