import 'package:flutter/material.dart';
import 'package:flutter_nhom4/detail_new.dart';
import 'package:flutter_nhom4/model/new.dart';
import 'package:flutter_nhom4/get_api_news.dart';

class ListNews extends StatefulWidget {
  const ListNews({super.key});

  @override
  State<ListNews> createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews> {
  String searchText = "";
  late Future<List<Article>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = test_api_new.getAllNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tin tức nổi bật",
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Article>>(
        future: futureArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Lỗi tải dữ liệu: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Không có tin tức nào"));
          }

          List<Article> allArticles = snapshot.data!;

          List<Article> filtered = allArticles.where((article) {
            return article.title.toLowerCase().contains(
                  searchText.toLowerCase(),
                ) ||
                article.description.toLowerCase().contains(
                  searchText.toLowerCase(),
                );
          }).toList();

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Tìm kiếm tin tức...",
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

  Widget myListView(List<Article> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return myItem(articles[index]);
      },
    );
  }

  Widget myItem(Article article) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailNews(article: article)),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  article.urlToImage ?? "",
                  width: 100,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/images/nophoto.png",
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),

              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 6),

                    Text(
                      article.source.name,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 6),

                    Row(
                      children: [
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget newsImage(
    String? imageUrl, {
    double width = double.infinity,
    double height = 200,
  }) {
    return Image.network(
      imageUrl ?? "",
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          "assets/images/nophoto.png",
          width: width,
          height: height,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
