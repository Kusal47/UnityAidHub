import 'package:flutter/material.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import '../../../utils/text_design.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class CommentCRUD extends StatelessWidget {
  const CommentCRUD({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(route: RouteName.comments, body: Container(child:  const TextDesign(text:
          'Comments',
            fontweight: FontWeight.w700,
            fontsize: 24,
          
        ),));
  }
}