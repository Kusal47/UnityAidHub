import 'package:flutter/material.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import 'package:unity_admin/main.dart';

class PostVerification extends StatelessWidget {
  const PostVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(route: RouteName.postverify, body: Container(child: Text('Post Verification'),));
  }
}