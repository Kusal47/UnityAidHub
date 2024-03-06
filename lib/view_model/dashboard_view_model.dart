// dashboard_view_model.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../core/const/base_url.dart';

class DashboardViewModel extends ChangeNotifier {
  Dio dio = Dio();

  int totalUsers = 0;
  int totalActiveUsers = 0;
  int totalInActiveUsers = 0;
  int totalPosts = 0;
  int totalVerifiedPosts = 0;
  int totalUnverifiedPosts = 0;
  int totalDonation = 0;
  int totalDonationCount = 0;
  int totalDonationDay = 0;

  Future<void> fetchData() async {
    try {
      Response responseUser = await dio.get(
        '${ApiUrl.baseUrl}dashboard/user-count',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      Response responseActiveUser = await dio.get(
        '${ApiUrl.baseUrl}dashboard/user-count',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      Response responseInactiveUser = await dio.get(
        '${ApiUrl.baseUrl}dashboard/user-count',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      Response responsePost = await dio.get(
        '${ApiUrl.baseUrl}dashboard/post-count',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      Response responsePostV = await dio.get(
        '${ApiUrl.baseUrl}dashboard/post-count',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      Response responsePostUV = await dio.get(
        '${ApiUrl.baseUrl}dashboard/post-count',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      Response responseTotalDonation = await dio.get(
        '${ApiUrl.baseUrl}dashboard/totalDonation',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      Response responseDonationCount = await dio.get(
        '${ApiUrl.baseUrl}dashboard/donation-count',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      Response responseDonationDay = await dio.get(
        '${ApiUrl.baseUrl}dashboard/donation-day',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

totalUsers = responseUser.data['totalUser'] ?? 0;
    totalActiveUsers = responseActiveUser.data['activeUser'] ?? 0;
    totalInActiveUsers = responseInactiveUser.data['inactiveUser'] ?? 0;
    totalPosts = responsePost.data['totalPost'] ?? 0;
    totalVerifiedPosts = responsePostV.data['verifiedPost'] ?? 0;
    totalUnverifiedPosts = responsePostUV.data['notVerifiedPost'] ?? 0;
    totalDonation = responseTotalDonation.data['totalDonation'] ?? 0;
    totalDonationCount = responseDonationCount.data['totalDonationAmount'] ?? 0;
    totalDonationDay = responseDonationDay.data['totalDonationOfDay'] ?? 0;

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}

// Future<void> fetchtotalUser(){}
// Future<void> fetchtotalPost(){}
// Future<void> fetchtotalVerifiedPosts(){}
// Future<void> fetchtotalUnverifiedPosts(){}
// Future<void> fetchtotalDonation(){}
// Future<void> fetchtotalDonationCount(){}
// Future<void> fetchtotalDonationDay(){}

 