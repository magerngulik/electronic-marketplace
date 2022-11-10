import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/cart_item_view.dart';

class CartItemController extends ChangeNotifier implements HyperController {
  CartItemView? view;
  refresh() {
    notifyListeners();
  }
}

final cartItemController = ChangeNotifierProvider<CartItemController>((ref) {
  return CartItemController();
});
