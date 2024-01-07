import 'package:flutter/material.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import 'package:unity_admin/main.dart';

class AdsManagement extends StatelessWidget {
  const AdsManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(route: RouteName.adsmanagement, body: Container(child: Text('Ads Management'),));
  }
}