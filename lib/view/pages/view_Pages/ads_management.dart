import 'package:flutter/material.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import '../../../utils/text_design.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class AdsManagement extends StatelessWidget {
  const AdsManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(route: RouteName.adsmanagement, body: TextDesign(text:
          'Ads Management',
            fontweight: FontWeight.w700,
            fontsize: 24,
          
        ));
  }
}