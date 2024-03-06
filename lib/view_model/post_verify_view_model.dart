// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import '../Models/post_model.dart';
import '../core/const/base_url.dart';
import '../utils/dialogs.dart';
import '../utils/toast_utils.dart';

class PostVerificationViewModel extends ChangeNotifier {
  String details = '';
  Dio dio = Dio();
  Future<List<Post>> fetchPostsFromApi(BuildContext context) async {
    try {
      Response response = await dio.get('${ApiUrl.baseUrl}posts/notverified');
      if (response.statusCode == 200 || response.statusCode == 201) {
        
        List<dynamic> postData = response.data;
        print('Post data: $postData');

        List<Post> posts = postData.map((data) => Post.fromJson(data)).toList();
        details = posts.length.toString();
        return posts;
      } else {
        print('Error fetching posts - Status code: ${response.statusCode}, Body: ${response.data}');
        throw Exception('Failed to fetch posts');
      }
    } catch (e) {
      showDialogonerror(
          context, 'Unable to Load Data', 'There went something wrong while loading Posts.', () {
        Navigator.pushNamed(context, RouteName.login);
      });

      print('Error fetching posts: $e');
      throw Exception('Failed to fetch posts');
    }
  }

  Future<List<Post>> fetchVerifiedPosts(BuildContext context) async {
    try {
      Response response = await dio.get('${ApiUrl.baseUrl}posts/verified');
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse the response data into a list of posts
        List<dynamic> postData = response.data;
        print('Post data: $postData');

        List<Post> posts = postData.map((data) => Post.fromJson(data)).toList();
        details = posts.length.toString();
        return posts;
      } else {
        print('Error fetching posts - Status code: ${response.statusCode}, Body: ${response.data}');
        throw Exception('Failed to fetch posts');
      }
    } catch (e) {
      showDialogonerror(
          context, 'Unable to Load Data', 'There went something wrong while loading Posts.', () {
        Navigator.pushNamed(context, RouteName.login);
      });

      print('Error fetching posts: $e');
      throw Exception('Failed to fetch posts');
    }
  }

  Future<void> approvePost(BuildContext context, String postid) async {
    try {
      // FormData formData = FormData.fromMap({
      //   'status': 'VERIFIED',
      // });
      // Map<String, dynamic> jsonData = TextAndImageConversion().formDataToJson(formData);
      Response response = await dio.patch(
        '${ApiUrl.baseUrl}posts/$postid/verify',
        // data: jsonData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        print('Post status updated successfully');
      } else {
        ToastUtils().showCherryToast(context, 'Unable to update Post status', true);
        print(
            'Failed to update Post status - Status code: ${response.statusCode}, Body: ${response.data}');
        throw Exception('Failed to update Post status');
      }
    } catch (e) {
      print('Error update Post status: $e');
      throw Exception('Failed to update Post status');
    }
  }

  Future<void> rejectPost(String postId, BuildContext context) async {
    try {
      Response response = await dio.delete(
        '${ApiUrl.baseUrl}posts/$postId',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Cache-Control': 'no-cache',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        print('Post rejected successfully');
      } else {
        ToastUtils().showCherryToast(context, 'Unable to rejected Post', true);
        print(
            'Failed to rejected Post - Status code: ${response.statusCode}, Body: ${response.data}');
        throw Exception('Failed to rejected Post');
      }
    } catch (e) {
      print('Error rejected Post: $e');
      throw Exception('Failed to rejected Post');
    }
  }

  Future<List<Post>> fetchPostsVerified(BuildContext context) async {
    try {
      Response response = await dio.get('${ApiUrl.baseUrl}posts/verified');
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse the response data into a list of posts
        List<dynamic> postData = response.data;
        print('Post data: $postData');

        List<Post> posts = postData.map((data) => Post.fromJson(data)).toList();

        return posts;
      } else {
        print('Error fetching posts - Status code: ${response.statusCode}, Body: ${response.data}');
        throw Exception('Failed to fetch posts');
      }
    } catch (e) {
      showDialogonerror(
          context, 'Unable to Load Data', 'There went something wrong while loading Posts.', () {
        Navigator.pushNamed(context, RouteName.login);
      });

      print('Error fetching posts: $e');
      throw Exception('Failed to fetch posts');
    }
  }
}
