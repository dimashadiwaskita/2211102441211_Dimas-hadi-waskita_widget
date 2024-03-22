import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Commerce'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: viewportConstraints.maxWidth,
                      child: Image(
                        image: const NetworkImage(
                            'https://scene7.toyota.eu/is/image/toyotaeurope/aygo-x-exclusive-red-retail:Small-Landscape?ts=1666960236550&resMode=sharp2&op_usm=1.75,0.3,2,0'),
                      ),
                    ),
                  ),
                  const ListProducts(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: viewportConstraints.maxWidth,
                      child: Image(
                        image: NetworkImage(
                            'https://scene7.toyota.eu/is/image/toyotaeurope/RAV4-2018-NOT-UK-SPEC-10-scaled:Small-Landscape?ts=0&resMode=sharp2&op_usm=1.75,0.3,2,0'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60.0,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Handle search button press
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Handle cart button press
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Handle profile button press
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListProducts extends StatelessWidget {
  const ListProducts({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ProductImage(),
            ProductImage(
              rndSeed: 2,
              nama: "lukisan 1",
              harga: 5000000,
            ),
            ProductImage(
              rndSeed: 3,
            )
          ],
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final int rndSeed;
  final String nama;
  final double harga;
  const ProductImage(
      {Key? key,
      this.rndSeed = 1,
      this.nama = "Product Name",
      this.harga = 0.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image(
              image:
                  NetworkImage('https://picsum.photos/200/?random=$rndSeed')),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(nama), Text("Rp. $harga")])
        ],
      ),
    );
  }
}
