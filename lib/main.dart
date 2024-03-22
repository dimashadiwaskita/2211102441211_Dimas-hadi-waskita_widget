import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Online Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Product> products = [
    Product(
        imageUrl:
            'https://tse4.mm.bing.net/th?id=OIP.Kc2PFfEbRxLQEPjq4bonOwHaHa&pid=Api&P=0&h=220/4x4',
        name: 'Sepatu santai',
        price: 100000),
    Product(
        imageUrl:
            'https://tse3.mm.bing.net/th?id=OIP.wSWp2iZ_3ph6ibN9F93-nAHaEl&pid=Api&P=0&h=220/4x4',
        name: 'Sepatu volly',
        price: 135000),
    Product(
        imageUrl:
            'https://tse2.mm.bing.net/th?id=OIP.ztrWbGn0si85V2weKbdUVQHaEs&pid=Api&P=0&h=220/4x4',
        name: 'Sepatu olahraga',
        price: 300000),
  ];

  final List<Product> cart = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Online Store'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: products.map((product) {
            return ProductCard(
              product: product,
              onAddToCart: () {
                setState(() {
                  cart.add(product);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Product added to cart')),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const ProductCard({
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            child: Image.network(
              product.imageUrl,
              width: 4,
              height: 4,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            'Rp. ${product.price.toString()}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: onAddToCart,
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String imageUrl;
  final String name;
  final double price;

  Product({
    required this.imageUrl,
    required this.name,
    required this.price,
  });
}

class CartScreen extends StatelessWidget {
  final List<Product> cart;

  const CartScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(
              cart[index].imageUrl,
              width: 50,
              height: 50,
            ),
            title: Text(cart[index].name),
            subtitle: Text('Rp. ${cart[index].price.toString()}'),
            trailing: ElevatedButton(
              onPressed: () {
                // Action saat tombol "Beli Sekarang" ditekan
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Checkout: ${cart[index].name}')),
                );
                // Implementasikan logika belanja di sini
              },
              child: Text('Beli Sekarang'),
            ),
          );
        },
      ),
    );
  }
}
