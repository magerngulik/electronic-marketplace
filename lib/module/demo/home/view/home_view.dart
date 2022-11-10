import 'package:fhe_template/core.dart';
import 'package:fhe_template/services/product_services.dart';
import 'package:fhe_template/shared/widget/list/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../services/cart_item.dart';

class HomeView1 extends ConsumerStatefulWidget {
  const HomeView1({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeView1State();
}

class _HomeView1State extends ConsumerState<HomeView1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeController controller = ref.watch(homeController);
    controller.view = widget;
    var GetcartProduct = ref.watch(listProductCart);

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 110.0,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(
                    150.0,
                  ),
                  bottomLeft: Radius.circular(
                    150.0,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                //search bar
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        padding: const EdgeInsets.symmetric(
                          vertical: 6.0,
                          horizontal: 12.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                          border: Border.all(
                            width: 1.0,
                            color: Colors.grey[400]!,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.search),
                            ),
                            Expanded(
                              child: TextFormField(
                                initialValue: null,
                                decoration: const InputDecoration.collapsed(
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  hintText: "Search",
                                ),
                                onFieldSubmitted: (value) {
                                  controller.updateSearch(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartItemView()),
                            );
                            await controller.refresh();
                          },
                          icon: Stack(children: [
                            const Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                            (GetcartProduct.isNotEmpty)
                                ? Align(
                                    alignment: Alignment.topRight,
                                    child: CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.red,
                                      child: Text(
                                        "${GetcartProduct.length}",
                                        style: const TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container()
                          ]),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border_outlined,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                //end search bar

                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Qlist(
                    id: "product_list",
                    getFuture: (page, query) async {
                      return await ProductServices.getProduts(
                          search: query['search'].toString());
                    },
                    itemBuilder: (item, index) {
                      return InkWell(
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailitemView(
                                          item: item,
                                        )),
                              ),
                          child: ConList(item: item));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
