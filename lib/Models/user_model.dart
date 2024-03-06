import 'package:intl/intl.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String role;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      role: json['roles'],
      id: json['id'],
      name: json['name'],
    );
  }
}

class AppUser {
  final int userId;
  final String username;
  final String phoneNumber;
  final String email;
  final String address;
  final String role;
  final String status;
  final String date;
  final String image;

  AppUser(
      {required this.userId,
      required this.username,
      required this.email,
      required this.date,
      required this.phoneNumber,
      required this.address,
      required this.status,
      required this.role,
      required this.image});
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
        userId: json['id']??0,
        username: json['name']??'',
        email: json['email']??'',
        role: json['roles'],
        date: DateFormat('yyyy-MM-dd').format(DateTime.parse(json['createdAt'])).toString(),
        status: json['activity'],
        phoneNumber: json['phoneNumber']??'',
        address: json['address']??'',
        image: json['profilePictureUrl']??'');
  }
}
