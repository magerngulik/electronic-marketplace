import 'package:fhe_template/core.dart';
import 'package:fhe_template/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await initialize();

  Widget mainView = const DashboardView();

  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: mainView,
      ),
    ),
  );
}
