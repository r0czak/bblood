class NewsInfoModel {
  String title;
  String description;
  String image;

  NewsInfoModel(
      {required this.title,
        required this.description,
        required this.image});

  factory NewsInfoModel.fromMap(map) {
    return NewsInfoModel(
        title: map['title'],
        description: map['description'],
        image: map['image']);
  }

  Map<String, dynamic> toMap() {
    return {
      'address': title,
      'description': description,
      'image': image
    };
  }
}
