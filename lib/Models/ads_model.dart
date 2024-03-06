class Ads {
  // final int adId;
  final String title;
  final String desc;
  final String image;
  final String type;
  final String activity;
  final String companyName;

  Ads({
    required this.title,
    required this.desc,
    required this.image,
    required this.activity,
    required this.type,
    required this.companyName,
  });

  factory Ads.fromJson(Map<String, dynamic> json) {
    return Ads(
        // adId: json['id'],
        title: json['title'],
        desc: json['desc'],
        image: json['image'],
        activity: json['activity'],
        type: json['type'],
        companyName: json['companyName']);
  }
}
