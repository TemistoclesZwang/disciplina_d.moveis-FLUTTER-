class ImgModel {
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  // News({this.userId, this.id, this.title});
  ImgModel({this.id, this.title, this.url, this.thumbnailUrl});

  factory ImgModel.fromJson(Map<String, dynamic> json) {
    return ImgModel(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
