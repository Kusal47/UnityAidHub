import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unity_admin/core/theme/app_color.dart';
import 'package:unity_admin/utils/text_design.dart';
import 'package:unity_admin/view_model/user_manage_view_model.dart';
import '../Models/post_model.dart';
import '../Models/user_model.dart';

void showDocumentDetails(BuildContext context, Post selectedPost, int index) {
  showDialog(
    barrierDismissible: true,
    useSafeArea: true,
    context: context,
    builder: (_) {
      final imageUrl = selectedPost.documents[index];
      return AlertDialog(
        elevation: 10.0,
        backgroundColor: AppColor.white,
        // backgroundColor: Colors.white,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: TextDesign(
                text: 'Return',
                color: AppColor.whiteColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
        title: const Center(
          child: TextDesign(
            text: 'Documents Information',
            fontweight: FontWeight.w900,
            fontsize: 24,
          ),
        ),
        content: Container(
          color: AppColor.white,
          width: 600,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                imageUrl.startsWith('http')
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.fitHeight,
                        filterQuality: FilterQuality.high,
                      )
                    : Image.memory(
                        base64.decode(imageUrl.split(',').last),
                        fit: BoxFit.fitHeight,
                        filterQuality: FilterQuality.high,
                      ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void userDelete(
  BuildContext context,
  AppUser user,
  UserViewModel viewModel,
) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          elevation: 10.0,
          backgroundColor: AppColor.whiteColor,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: TextDesign(
                text: 'OK',
                color: AppColor.whiteColor,
              ),
              onPressed: () async {
                await viewModel.deleteUser(user.userId.toString(), context);
                Navigator.pop(context);
              },
            ),
          ],
          title: Text('Delete User ${user.username}'),
          content: const Text("Are you sure to delete this user"),
        );
      });
}
