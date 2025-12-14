import 'package:flutter/material.dart';
import 'package:flutter_nhom4/model/product.dart';

class DetailProduct extends StatefulWidget {
  final Product product;  

  const DetailProduct({super.key, required this.product});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    final p = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text("NQH Shop",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor:Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text("Chi tiết sản phẩm",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0))),
                SizedBox(height: 20),
            
            Image.network(p.image, height: 250),
            SizedBox(height: 10),
            Text(
              p.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Giá: \$${p.price}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
                SizedBox(width: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Text("${p.rating.rate} (${p.rating.count})"),
              ],
            ),

            SizedBox(height: 20),
            Text(
              p.description,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
