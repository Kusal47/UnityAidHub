class Post {
  final int postId;
  final String image;
  final String title;
  final String date;
  final String desc;
  final String country;

  Post(
      {required this.title,
      required this.postId,
      required this.date,
       this.country = 'United States of America, ',
      required this.desc,
      required this.image});


      
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['id'],
      title: json['title'],
      date: json['date'],
      country: json['country'],
      desc: json['desc'],
      image: json['image'],
    );
  }
}
