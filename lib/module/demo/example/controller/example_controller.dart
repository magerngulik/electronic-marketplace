import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/example_view.dart';

class ExampleController extends ChangeNotifier implements HyperController {
  ExampleView? view;
}

final exampleController = ChangeNotifierProvider<ExampleController>((ref) {
  return ExampleController();
});
