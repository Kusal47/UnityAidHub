
import 'package:provider/provider.dart';

import '../core/theme/app_color.dart';
import '../view_model/sidebar_view_model.dart';
import 'package:flutter/material.dart';

import 'view/agent_view/agent_detail.dart';
import 'view/agent_view/internal_agent.dart';
import 'view/balance/balance_page.dart';
import 'view/history/history_page.dart';
import 'view/home_screen/home_screen.dart';
import 'view/order_screen/order_screen.dart';
import 'view/order_summary.dart';
import 'view/result_screen/result_screen.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sideBarViewModel = Provider.of<SideBarViewModel>(context);

    return Container(
      height: double.infinity,
      width: 280.0,
      color: AppColor.secondaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/spotify_logo.png',
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _SideMenuIconTab(
            iconData: Icons.home,
            title: 'Home',
            onTap: () {
              sideBarViewModel.setCurrentPage(HomeScreen());
            },
          ),
          _SideMenuIconTab(
            iconData: Icons.shopping_bag,
            title: 'Order',
            onTap: () {
              sideBarViewModel.setCurrentPage(OrderScreen());
            },
          ),
          _SideMenuIconTab(
            iconData: Icons.account_box,
            title: 'Agents',
            onTap: () {
              sideBarViewModel.setCurrentPage(AgentDetails());
            },
          ),
          _SideMenuIconTab(
            iconData: Icons.person_2,
            title: 'Internal Agents',
            onTap: () {
              sideBarViewModel.setCurrentPage(InternalAgentPage());
            },
          ),
          _SideMenuIconTab(
            iconData: Icons.gif_box,
            title: 'History',
            onTap: () {
              sideBarViewModel.setCurrentPage(HistoryPage());
            },
          ),
          _SideMenuIconTab(
            iconData: Icons.payment,
            title: 'Agents H',
            onTap: () {
              sideBarViewModel.setCurrentPage(OrderSummary());
            },
          ),
          _SideMenuIconTab(
            iconData: Icons.payment,
            title: 'Balance',
            onTap: () {
              sideBarViewModel.setCurrentPage(BalancePage());
            },
          ),
          _SideMenuIconTab(
            iconData: Icons.payment,
            title: 'Result',
            onTap: () {
              sideBarViewModel.setCurrentPage(ResultPage());
            },
          ),
          _SideMenuIconTab(
            iconData: Icons.logout_outlined,
            title: 'Log out',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}

// class _SideMenuIconTab extends StatelessWidget {
//   final IconData iconData;
//   final String title;
//   final VoidCallback onTap;

//   const _SideMenuIconTab({
//     Key? key,
//     required this.iconData,
//     required this.title,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final sideBarViewModel=Provider.of<SideBarViewModel>(context);

//     return MouseRegion(
//  onHover: (e) {
//   sideBarViewModel.bgColor;
//   sideBarViewModel.color;

//       },
//            child: ListTile(
//         leading: Icon(
//           iconData,
//           color:Colors.white,
//           size: 28.0,
//         ),
//         title: Text(

//           title,
//           style: TextStyle(color: Colors.white),
//           overflow: TextOverflow.ellipsis,
//         ),
//         onTap: onTap,
//       ),
//     );
//   }
// }
class _SideMenuIconTab extends StatefulWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const _SideMenuIconTab({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  _SideMenuIconTabState createState() => _SideMenuIconTabState();
}

class _SideMenuIconTabState extends State<_SideMenuIconTab> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: ListTile(
        leading: Icon(
          widget.iconData,
          color: isHovered ? Colors.amberAccent : Colors.white,
          size: 28.0,
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            color: isHovered ? Colors.amberAccent : Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        onTap: widget.onTap,
      ),
    );
  }
}
