import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../services/cart_item.dart';
import 'package:card_swiper/card_swiper.dart';

class DetailitemView extends ConsumerWidget {
  Map item;

  DetailitemView({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    DetailitemController controller = ref.watch(detailitemController);
    controller.view = this;
    var value = ref.watch(counter);
    var GetcartProduct = ref.watch(listProductCart);

    var hargaAwal = item['price'];
    var discount = item['discountPercentage'];
    var discontprice = (hargaAwal! * discount!) / 100;
    var newharga = hargaAwal - discontprice;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: 24.0,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartItemView()),
              );
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
              Icons.menu,
              size: 24.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        var getImageDetail = item['images'][index];
                        var getcountImageDetail = item['images'];
                        return Image.network(
                          getImageDetail.toString(),
                          fit: BoxFit.fitHeight,
                        );
                      },
                      itemCount: 5,
                      pagination: const SwiperPagination(),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "\$${newharga.toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          size: 24.0,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        height: 28,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              5,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "${item['discountPercentage'].toStringAsFixed(0)}%",
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "\$${hargaAwal.toString()}",
                        style: const TextStyle(
                          fontSize: 20.0,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${item['title']}",
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 24.0,
                          color: Colors.yellow,
                        ),
                        Text(
                          "${item['rating']}",
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "${item['brand']} product",
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: 150.0,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16.0,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: const Text(
                      "Detail Produk",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "${item['description']}",
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              16.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 45.0,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    8.0,
                  ),
                ),
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey,
                ),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chat_outlined,
                    size: 24.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Container(
              height: 45.0,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    8.0,
                  ),
                ),
                border: Border.all(
                  width: 3,
                  color: Colors.blue,
                ),
              ),
              child: const Center(
                child: Text(
                  "Beli",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            InkWell(
              onTap: () {
                ref.read(listProductCart.notifier).state.add(item);
                controller.refresh();
              },
              child: Container(
                height: 45.0,
                width: 150,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      8.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        size: 24.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "Keranjang",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
