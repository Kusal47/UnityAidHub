import 'package:flutter/material.dart';
import 'package:unity_admin/core/routes/routes_name.dart';

import '../../../utils/text_design.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class PostVerification extends StatelessWidget {
  const PostVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(route: RouteName.postverify, body: Container(child:  const TextDesign(text:
          'Post Verification',
            fontweight: FontWeight.w700,
            fontsize: 24,
          
        )));
  }
}