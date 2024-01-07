import 'package:flutter/material.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import 'package:unity_admin/main.dart';

class PagesSection extends StatelessWidget {
  const PagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(route: RouteName.pagesection, body: Container(child: Text('PageSection'),));
  }
}