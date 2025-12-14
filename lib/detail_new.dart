import 'package:flutter/material.dart';
import 'package:flutter_nhom4/model/new.dart';

class DetailNews extends StatelessWidget {
  final Article article;

  const DetailNews({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết tin tức", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                article.urlToImage ?? "",
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/nophoto.png",
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        article.source.name,
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.access_time, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        article.publishedAt.toLocal().toString().substring(
                          0,
                          16,
                        ),
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  if (article.author != null)
                    Text(
                      "Tác giả: ${article.author}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                  SizedBox(height: 15),

                  Text(
                    article.description,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),

                  SizedBox(height: 15),
                  Text(
                    article.content,
                    style: const TextStyle(fontSize: 16, height: 1.6),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Nguồn bài viết:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 5),

                  SelectableText(
                    article.url,
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
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
