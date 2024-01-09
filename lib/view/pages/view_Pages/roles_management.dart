import 'package:flutter/material.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import '../../../utils/text_design.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class RolesManagement extends StatelessWidget {
  const RolesManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(route: RouteName.rolesmanagement, body: Container(child: const TextDesign(text:
          'Roles Management',
            fontweight: FontWeight.w700,
            fontsize: 24,
          
        ),));
  }
}