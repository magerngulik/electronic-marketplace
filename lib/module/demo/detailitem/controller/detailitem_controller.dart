import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/detailitem_view.dart';

class DetailitemController extends ChangeNotifier implements HyperController {
  DetailitemView? view;

  refresh() {
    notifyListeners();
  }
}

final detailitemController =
    ChangeNotifierProvider<DetailitemController>((ref) {
  return DetailitemController();
});
