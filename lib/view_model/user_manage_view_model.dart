import 'package:flutter/material.dart';

import '../Models/user_model.dart';

class UserViewModel extends ChangeNotifier {
  var selectedValue;
  TextEditingController searchC = TextEditingController();
  List<User> searchResult = [];

  void searchUser(String search, List<User> userList) {
    searchResult.clear();
    // Filtering the users based on the search controller
    searchResult = userList.where((user) {
      return user.username.toLowerCase().contains(search.toLowerCase()) ||
          user.category.toLowerCase().contains(search.toLowerCase());
    }).toList();
    // print(searchResult.toList());
    notifyListeners();
  }
}
