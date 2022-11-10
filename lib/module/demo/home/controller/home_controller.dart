import 'package:fhe_template/shared/widget/list/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';

import '../view/home_view.dart';

class HomeController extends ChangeNotifier implements HyperController {
  HomeView1? view;

  void addmenu() {
    notifyListeners();
  }

  refresh() {
    notifyListeners();
  }

  String search = "";

  updateSearch(value) {
    search = value;
    Qlist.instance['product_list']!.query["search"] = value;
    Qlist.instance['product_list']!.onRefresh();
    notifyListeners();
  }
}

final homeController = ChangeNotifierProvider<HomeController>((ref) {
  return HomeController();
});
