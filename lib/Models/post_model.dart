// // class Post {
// //   final int postId;
// //   final String image;
// //   final String title;
// //   final String date;
// //   final String desc;
// //   final String country;

// //   Post(
// //       {required this.title,
// //       required this.postId,
// //       required this.date,
// //        this.country = 'United States of America, ',
// //       required this.desc,
// //       required this.image});

// //   factory Post.fromJson(Map<String, dynamic> json) {
// //     return Post(
// //       postId: json['id'],
// //       title: json['title'],
// //       date: json['date'],
// //       country: json['country'],
// //       desc: json['desc'],
// //       image: json['image'],
// //     );
// //   }
// // }

// class Post {
//   final int postId;
//   final String title;
//   final String desc;
//   final List<String> image;
//   final String date;
//   // final DateTime startDate;
//   // final DateTime endDate;
//   // final int goalAmount;
//   // final int currentAmount;
//   // final int view;
//   // final String status;
//   // final String postType;
//   // final String postUpdates;
//   // final int categoryId;
//   // final int userId;

//   Post({
//     required this.postId,
//     required this.title,
//     required this.desc,
//     required this.image,
//     required this.date,
//     // required this.startDate,
//     // required this.endDate,
//     // required this.goalAmount,
//     // required this.currentAmount,
//     // required this.view,
//     // required this.status,
//     // required this.postType,
//     // required this.postUpdates,
//     // required this.categoryId,
//     // required this.userId,
//   });

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       postId: json['postId'],
//       title: json['title'],
//       desc: json['description'],
//       image: List<String>.from(json['image']),
//       date: '2070',
//       // startDate: DateTime.parse(json['startDate']),
//       // endDate: DateTime.parse(json['endDate']),
//       // goalAmount: json['goalAmount'],
//       // currentAmount: json['currentAmount'],
//       // view: json['view'],
//       // status: json['status'],
//       // postType: json['postType'],
//       // postUpdates: json['postUpdates'],
//       // categoryId: json['categoryId'],
//       // userId: json['userId'],
//     );
//   }
// }

import 'package:intl/intl.dart';

class Post {
  final int id;
  final String title;
  final String description;
  final List<String> image;
  final List<String> documents;
  final String startDate;
  // final DateTime endDate;
  final String goalAmount;
  final int currentAmount;
  // final int view;
  final String status;
  final String postType;
  // final String postUpdates;
  final int categoryId;
  final int userId;
  final String country;

  Post( {
    required this.country,
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.documents,
    required this.startDate,
    // required this.endDate,
    required this.goalAmount,
    required this.currentAmount,
    // required this.view,
    required this.status,
    required this.postType,
    // required this.postUpdates,
    required this.categoryId,
    required this.userId,
  });

factory Post.fromJson(Map<String, dynamic> json) {
  return Post(
    id: json['id']??0,
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    image: List<String>.from(json['image'] ?? []),
    documents: List<String>.from(json['documents'] ?? []),
    startDate: DateFormat('yyyy-MM-dd').format(DateTime.parse(json['createdAt'])).toString(),
    goalAmount: json['goalAmount'] ?? 0,
    currentAmount: json['currentAmount'] ?? 0,
    status: json['status'] ?? '',
    postType: json['postType'] ?? '',
    categoryId: json['categoryId'] ?? 0,
    userId: json['userId'] ?? 0,
    country: json['country'] ?? '',
  );
}

}

class PostVerified {
  final int id;
  final String title;
  final String description;
  final List<String> image;
  final List<String> documents;
  final String startDate;
  // final DateTime endDate;
  final String goalAmount;
  final int currentAmount;
  // final int view;
  final String status;
  final String postType;
  // final String postUpdates;
  final int categoryId;
  final int userId;
  final String country;

  PostVerified( {
    required this.country,
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.documents,
    required this.startDate,
    // required this.endDate,
    required this.goalAmount,
    required this.currentAmount,
    // required this.view,
    required this.status,
    required this.postType,
    // required this.postUpdates,
    required this.categoryId,
    required this.userId,
  });

factory PostVerified.fromJson(Map<String, dynamic> json) {
  return PostVerified(
    id: json['id']??0,
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    image: List<String>.from(json['image'] ?? []),
    documents: List<String>.from(json['documents'] ?? []),
    startDate: DateFormat('yyyy-MM-dd').format(DateTime.parse(json['createdAt'])).toString(),
    goalAmount: json['goalAmount'] ?? 0,
    currentAmount: json['currentAmount'] ?? 0,
    status: json['status'] ?? '',
    postType: json['postType'] ?? '',
    categoryId: json['categoryId'] ?? 0,
    userId: json['userId'] ?? 0,
    country: json['country'] ?? '',
  );
}

}
