import 'package:flutter/material.dart';

class ShoppingBasket extends StatefulWidget {
  const ShoppingBasket({super.key});

  @override
  State<ShoppingBasket> createState() => _ShoppingBasketState();
}

class _ShoppingBasketState extends State<ShoppingBasket> {
  // Defining the items statically
  List<Map<String, dynamic>> items = [
    {"name": "Product 1", "quantity": 1, "price": 20},
    {"name": "Product 2", "quantity": 1, "price": 15},
    {"name": "Product 3", "quantity": 1, "price": 25},
    {"name": "Product 4", "quantity": 1, "price": 10},
    {"name": "Product 5", "quantity": 1, "price": 30},
  ];

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void increaseQuantity(int index) {
    setState(() {
      items[index]['quantity'] += 1;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (items[index]['quantity'] > 0) {
        items[index]['quantity'] -= 1;
      }
    });
  }

  int _calculateTotalPrice() {
    int totalPrice = 0;
    for (var item in items) {
      totalPrice += (item['quantity'] as int) * (item['price'] as int);
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 72, 49, 39),
        title: const Text("Shopping Basket"),
      ),
      body: Column(
        children: [
          Expanded(child: _listItem(context)),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                // Handle buy now action
              },
              child: Text("Buy Now (\$${_calculateTotalPrice()})"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listItem(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        var item = items[index];
        return Container(
          color: Color.fromARGB(255, 72, 49, 39),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  "https://ik.imagekit.io/vjt1kualr/drinks/caffe_corretto/main-image.jpg",
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["name"],
                      style: const TextStyle(color:Colors.grey,
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text("Quantity: ${item['quantity']}",style:TextStyle(color:Colors.grey) ,),
                    Text("Price: \$${item['price']}",style:TextStyle(color:Colors.grey)),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteItem(index),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.plus_one, color: Colors.green),
                        onPressed: () => increaseQuantity(index),
                      ),
                      Text(
                        item['quantity'].toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        icon: const Icon(Icons.exposure_minus_1,
                            color: Colors.blue),
                        onPressed: () => decreaseQuantity(index),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
