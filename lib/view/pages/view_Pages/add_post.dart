import 'package:flutter/material.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import '../../../utils/text_design.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      route: RouteName.postadd,
      body: TextDesign(
        text: 'Add Post',
        fontweight: FontWeight.w700,
        fontsize: 24,
      ),
    );
  }
}
