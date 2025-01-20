import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Product 1',
        'price': '₹29.99',
        'image': 'assets/images/rajdeep-logo.png',
      },
      {
        'name': 'Product 2',
        'price': '₹49.99',
        'image': 'assets/images/rajdeep-logo.png',
      },
      {
        'name': 'Product 3',
        'price': '₹19.99',
        'image': 'assets/images/rajdeep-logo.png',
      },
      {
        'name': 'Product 4',
        'price': '₹99.99',
        'image': 'assets/images/rajdeep-logo.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product List',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 1, 50, 174),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.8,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return _buildProductCard(
              name: product['name'],
              price: product['price'],
              image: product['image'],
              onAddToCart: () {
                print("${product['name']} added to cart");
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String name,
    required String price,
    required String image,
    required VoidCallback onAddToCart,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
                width: 100,
                height: 100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color.fromARGB(255, 1, 50, 174),
            ),
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: onAddToCart,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 1, 50, 174),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: const Text(
              'Add to Cart',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

class ProductPriceListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "sino": "1.",
      "name": "KDL E",
      "originalPrice": "200",
      "sellingPrice": "100",
      "image": ""
    },
    {
      "sino": "2.",
      "name": "Jazz series – JZ",
      "originalPrice": "250",
      "sellingPrice": "120",
      "image": ""
    },
    {
      "sino": "3.",
      "name": "BA",
      "originalPrice": "245",
      "sellingPrice": "170",
      "image": ""
    },
    {
      "sino": "4.",
      "name": "BGS-2V",
      "originalPrice": "270",
      "sellingPrice": "160",
      "image": ""
    },
    {
      "sino": "5.",
      "name": "BGS-HL/HDL",
      "originalPrice": "520",
      "sellingPrice": "410",
      "image": ""
    },
    // {"name": "Product B", "price": "₹45.50", "image": "assets/product_b.png"},
    // {"name": "Product C", "price": "₹15.00", "image": "assets/product_c.png"},
    // {"name": "Product D", "price": "₹65.00", "image": "assets/product_d.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Price List',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 1, 50, 174),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Text(
                product["sino"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              title: Text(
                product["name"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Original price',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 1, 50, 174),
                          // Strikethrough style
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '₹${product["originalPrice"]}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red[800],
                          decoration:
                              TextDecoration.lineThrough, // Strikethrough style
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 14,
                  ), // Space between the prices
                  Column(
                    children: [
                      const Text(
                        'Selling price',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 1, 50, 174),
                          // Strikethrough style
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '₹${product["sellingPrice"]}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[900],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
