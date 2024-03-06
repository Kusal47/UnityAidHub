class CategoryData {
  final int id;
  final String name;
  final String darkImage;
  final String lightImage;
  final String primaryImage;
  final String createdAt;
  final String updatedAt;

  CategoryData({
    required this.id,
    required this.name,
    required this.darkImage,
    required this.lightImage,
    required this.primaryImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['id'],
      name: json['name'],
      darkImage: json['darkImage'],
      lightImage: json['lightImage'],
      primaryImage: json['primaryImage'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
