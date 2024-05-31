import 'package:flutter/material.dart';
import 'package:flutter_application_1/bascket.dart';

class DetailItems extends StatefulWidget {
  const DetailItems({super.key});

  @override
  _DetailItemsState createState() => _DetailItemsState();
}

class _DetailItemsState extends State<DetailItems> {
  int quantity = 0;
  int unitPrice = 20;

  void increaseQuantity() {
    setState(() {
      quantity += 1;
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = unitPrice * quantity;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                "https://ik.imagekit.io/vjt1kualr/drinks/caffe_corretto/main-image.jpg",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Name produit",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                const SizedBox(
                  width: 70,
                ),
                Text("Price: \$$unitPrice",
                    style: const TextStyle(
                      fontSize: 15,
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: increaseQuantity,
                  child: const Icon(Icons.plus_one),
                ),
                const SizedBox(width: 20),
                Text(
                  quantity.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: decreaseQuantity,
                  child: const Icon(Icons.exposure_minus_1),
                ),
                const SizedBox(width: 20),
                Text(
                  "Total Price: \$$totalPrice",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoppingBasket(),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Text("Add to Cart "),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.add_shopping_cart_outlined)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
