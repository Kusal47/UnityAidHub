import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../side_menu.dart';
import '../../../view_model/sidebar_view_model.dart';


class ShellScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sideBarViewModel = Provider.of<SideBarViewModel>(context);
    print(sideBarViewModel.currentPage);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if (MediaQuery.of(context).size.width > 800) SideMenu(),
                Expanded(
                  child: sideBarViewModel.currentPage,
               ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
