class Article {
  final String title;
  final String description;
  final String content;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final Source source;
  final String? author;

  Article({
    required this.title,
    required this.description,
    required this.content,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.source,
    this.author,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      content: json['content'] ?? '',
      url: json['link'] ?? '',
      urlToImage: json['image_url'],
      publishedAt: DateTime.tryParse(json['pubDate'] ?? '') ?? DateTime.now(),
      source: Source(name: json['source_id'] ?? 'Unknown'),
      author: (json['creator'] != null && json['creator'] is List)
          ? json['creator'][0]
          : null,
    );
  }
}

class Source {
  final String name;

  Source({required this.name});
}
