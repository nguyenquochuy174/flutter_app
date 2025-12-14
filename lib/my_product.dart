import 'package:flutter/material.dart';
import 'package:flutter_nhom4/api.dart';
import 'package:flutter_nhom4/detail_product.dart';
import 'package:flutter_nhom4/model/product.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {

  String searchText = "";
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = test_api.getAllProduct(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NQH Shop", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: FutureBuilder(
        future: futureProducts,
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }

          List<Product> allProducts = snap.data!;
          List<Product> filtered =
              allProducts.where((p) => p.title.toLowerCase().contains(searchText.toLowerCase())).toList();

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Tìm kiếm sản phẩm...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                ),
              ),

              Expanded(child: myListView(filtered)),
            ],
          );
        },
      ),
    );
  }

  Widget myListView(List<Product> ls) {
    return ListView(
      children: ls.map((e) => myItem(e)).toList(),
    );
  }

  Widget myItem(Product p) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProduct(product: p), 
          ),
        );
      },
      child: Container(
        height: 150,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.network(p.image, height: 120, width: 120),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    p.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$${p.price}",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          SizedBox(width: 4),
                          Text("${p.rating.rate} (${p.rating.count})"),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.shopping_cart_outlined, color: Colors.blue, size: 30),
                        onPressed: () {
                          print("Thêm vào giỏ: ${p.title}");
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
