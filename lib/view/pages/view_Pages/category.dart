import 'package:flutter/material.dart';
import 'package:unity_admin/main.dart';

import '../../../core/routes/routes_name.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(route: RouteName.category, body: Container(child: Text('Category'),));
  }
}