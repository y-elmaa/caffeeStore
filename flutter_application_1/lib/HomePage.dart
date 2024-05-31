import 'package:flutter/material.dart';
import 'package:flutter_application_1/bascket.dart';
import 'package:flutter_application_1/detailitems.dart';
import 'package:flutter_application_1/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "homepage",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 72, 49, 39),
        actions: _buildAppBarActions(),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: _listItems(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            setState(() {
              _isSearching = false;
              _searchController.clear();
            });
          },
          icon: const Icon(Icons.close),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                // Handle search query change
              },
            ),
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            setState(() {
              _isSearching = true;
            });
          },
          icon: const Icon(Icons.search,
              color: Color.fromARGB(255, 170, 155, 156)),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 72, 49, 39),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
          },
          label: const Text("login"),
          icon: const Icon(Icons.person,
              color: Color.fromARGB(255, 170, 155, 156)),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ShoppingBasket(),
              ),
            );
          },
          icon: const Icon(Icons.shopping_cart,
              color: Color.fromARGB(255, 170, 155, 156)),
        ),
      ];
    }
  }

  List<Map<String, dynamic>> items = [
    {
      "name": "Product 1",
      "image":
          "https://ik.imagekit.io/vjt1kualr/drinks/caffe_corretto/main-image.jpg",
      "price": 20
    },
    {
      "name": "Product 1",
      "image":
          "https://ik.imagekit.io/vjt1kualr/drinks/caffe_corretto/main-image.jpg",
      "price": 20
    },
    {
      "name": "Product 1",
      "image":
          "https://ik.imagekit.io/vjt1kualr/drinks/caffe_corretto/main-image.jpg",
      "price": 20
    },
    {
      "name": "Product 1",
      "image":
          "https://ik.imagekit.io/vjt1kualr/drinks/caffe_corretto/main-image.jpg",
      "price": 20
    },
    {
      "name": "Product 1",
      "image":
          "https://ik.imagekit.io/vjt1kualr/drinks/caffe_corretto/main-image.jpg",
      "price": 20
    },
    {
      "name": "Product 1",
      "image":
          "https://ik.imagekit.io/vjt1kualr/drinks/caffe_corretto/main-image.jpg",
      "price": 20
    },
    {
      "name": "Product 1",
      "image":
          "https://ik.imagekit.io/vjt1kualr/drinks/caffe_corretto/main-image.jpg",
      "price": 20
    },
    {
      "name": "Product 1",
      "image":
          "https://ik.imagekit.io/vjt1kualr/drinks/caffe_corretto/main-image.jpg",
      "price": 20
    },
    
    
  ];
  Widget _listItems(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 300,
      ),
      itemBuilder: (BuildContext context, int index) {
        var item = items[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailItems(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Color.fromARGB(255, 72, 49, 39),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Image.network(
                    item["image"],
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["name"],
                        style: Theme.of(context).textTheme.titleMedium!.merge(
                              const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Price: \$${item['price'].toString()}",
                        style: Theme.of(context).textTheme.titleSmall!.merge(
                              TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.grey.shade500,
                              ),
                            ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShoppingBasket(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.add_shopping_cart_outlined,
                              color: Color.fromARGB(255, 170, 155, 156),
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
      },
    );
  }
}
