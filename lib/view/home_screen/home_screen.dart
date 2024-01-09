import 'package:flutter/material.dart';
import 'package:unity_admin/utils/text_design.dart';

import '../pages/AdminScaffold/admin_scaffold_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: '/dashboard',
      body: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10),
        child: const TextDesign(text:
          'Dashboard',
            fontweight: FontWeight.w700,
            fontsize: 24,
          
        ),
      ),
    );
  }
}
