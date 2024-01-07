import 'package:flutter/material.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import 'package:unity_admin/main.dart';

class RolesManagement extends StatelessWidget {
  const RolesManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(route: RouteName.rolesmanagement, body: Container(child: Text('Roles Management'),));
  }
}