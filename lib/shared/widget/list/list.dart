import 'package:flutter/material.dart';

class Qlist extends StatefulWidget {
  static Map<String, _QlistState> instance = {};
  final String id;
  final Function(int page, Map query) getFuture;
  final Function(Map item, int index) itemBuilder;

  const Qlist({
    required this.id,
    required this.getFuture,
    required this.itemBuilder,
    Key? key,
  }) : super(key: key);

  @override
  State<Qlist> createState() => _QlistState();
}

class _QlistState extends State<Qlist> {
  List items = [];
  int page = 1;
  Map query = {};

  onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    var response = await widget.getFuture(page, query);
    items = response['products'];
    setState(() {});
  }

  @override
  void initState() {
    onRefresh();
    Qlist.instance[widget.id] = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefresh(),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2.65,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          var item = items[index];
          return widget.itemBuilder(item, index);
        },
      ),
    );
  }
}
