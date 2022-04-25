class News {
  final String ?author;
  final String ?content;
  final String ?date;

  var news;

  // News({this.userId, this.id, this.title});
  News ({this.author, this.content,this.date});
  
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      // userId: json['userId'],
      // id: json['id'],
      // title: json['title'],
      author: json['author'],
      content: json['content'],
      date: json['date'],
    );
  }
}
