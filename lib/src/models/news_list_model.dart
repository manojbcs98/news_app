class News {
  final String uuid;
  final String title;
  final String description;
  final String keywords;
  final String snippet;
  final String url;
  final String imageUrl;
  final String language;
  final DateTime publishedAt;
  final String source;
  final List<String> categories;
  final double? relevanceScore;

  News({
    required this.uuid,
    required this.title,
    required this.description,
    required this.keywords,
    required this.snippet,
    required this.url,
    required this.imageUrl,
    required this.language,
    required this.publishedAt,
    required this.source,
    required this.categories,
    this.relevanceScore,
  });

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      uuid: map['uuid'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      keywords: map['keywords'] as String,
      snippet: map['snippet'] as String,
      url: map['url'] as String,
      imageUrl: map['image_url'] as String,
      language: map['language'] as String,
      publishedAt: DateTime.parse(map['published_at'] as String),
      source: map['source'] as String,
      categories: List<String>.from(map['categories'] as List),
      relevanceScore: map['relevance_score'] != null
          ? (map['relevance_score'] as num).toDouble()
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'title': title,
      'description': description,
      'keywords': keywords,
      'snippet': snippet,
      'url': url,
      'image_url': imageUrl,
      'language': language,
      'published_at': publishedAt.toIso8601String(),
      'source': source,
      'categories': categories,
      'relevance_score': relevanceScore,
    };
  }
}


