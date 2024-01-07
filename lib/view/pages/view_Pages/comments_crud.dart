import 'package:flutter/material.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import 'package:unity_admin/main.dart';

class CommentCRUD extends StatelessWidget {
  const CommentCRUD({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(route: RouteName.comments, body: Container(child: Text('Comments'),));
  }
}