class User {
  final int userId;
  // final String image;
  final String category;
  final String username;
  final String date;
  final String amount;
  final String paymentMethod;
  final String status;

  User({
    required this.userId,
    // required this.image,
    required this.category,
    required this.username,
    required this.date,
    required this.amount,
    required this.paymentMethod,
    required this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userId: json['id'],
        // image: json['image'],
        username: json['username'],
        category: json['category'],
        date: json['date'],
        amount: json['amount'],
        paymentMethod: json['payment'],
        status: json['status']);
  }
}
