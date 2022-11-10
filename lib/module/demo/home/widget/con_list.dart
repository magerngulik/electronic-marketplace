import 'package:flutter/material.dart';

class ConList extends StatefulWidget {
  Map item;

  ConList({Key? key, required this.item}) : super(key: key);

  @override
  State<ConList> createState() => _ConListState();
}

class _ConListState extends State<ConList> {
  getRupiahPrice(int harga) {
    var newharga = harga * 15000;
    return newharga;
  }

  @override
  Widget build(BuildContext context) {
    var getNewHarga = getRupiahPrice(widget.item['price']);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    "${widget.item['thumbnail']}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.item['title']}",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    "Rp. $getNewHarga",
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.gradient_outlined,
                        size: 20.0,
                        color: Colors.green,
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      Expanded(
                        child: Text(
                          "${widget.item['brand']}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 20.0,
                        color: Colors.yellow,
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        "${widget.item['rating']} Terjual",
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
