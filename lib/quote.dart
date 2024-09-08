class Quote {
  final String content;
  final String author;
  final List<String> tags; // Add tags field

  Quote({
    required this.content,
    required this.author,
    required this.tags, // Include tags in constructor
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      content: json['content'],
      author: json['author'],
      tags: List<String>.from(json['tags'] ?? []), // Extract tags from JSON
    );
  }
}
