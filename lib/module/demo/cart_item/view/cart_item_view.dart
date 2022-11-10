import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../services/cart_item.dart';
import '../controller/cart_item_controller.dart';

class CartItemView extends ConsumerWidget {
  const CartItemView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    CartItemController controller = ref.watch(cartItemController);
    controller.view = this;

    var item = ref.watch(listProductCart);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cart Item'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListView.builder(
                itemCount: item.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var items = item[index];
                  var hargaAwal = items['price'];
                  var discount = items['discountPercentage'];
                  var discontprice = (hargaAwal! * discount!) / 100;
                  var newharga = hargaAwal - discontprice;

                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(
                          "${items['thumbnail']}",
                        ),
                      ),
                      title: Text("${items['title']}"),
                      subtitle: Row(
                        children: [
                          Text(
                            "\$${hargaAwal.toString()}",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "\$${newharga.toStringAsFixed(0)}",
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          ref
                              .read(listProductCart.notifier)
                              .state
                              .removeAt(index);
                          controller.refresh();
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 24.0,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {},
                child: const Text("Checkout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
