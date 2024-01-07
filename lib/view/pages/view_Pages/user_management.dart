import 'package:flutter/material.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import 'package:unity_admin/main.dart';

class UserManagement extends StatelessWidget {
  const UserManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(route: RouteName.usermanagement, body: Container(child: Text('User Management'),));
  }
}