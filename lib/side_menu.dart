// import 'package:provider/provider.dart';
// import 'package:unity_admin/view/pages/auth/register_page.dart';

// import '../core/theme/app_color.dart';
// import '../view_model/sidebar_view_model.dart';
// import 'package:flutter/material.dart';

// import 'view/agent_view/agent_detail.dart';
// import 'view/agent_view/internal_agent.dart';
// import 'view/balance/balance_page.dart';
// import 'view/history/history_page.dart';
// import 'view/home_screen/home_screen.dart';
// import 'view/order_screen/order_screen.dart';
// import 'view/order_summary.dart';

// class SideMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final sideBarViewModel = Provider.of<SideBarViewModel>(context);

//     return Container(
//       height: double.infinity,
//       width: 280.0,
//       color: const Color(0xFF84FF7B),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: 
// Image.asset(
//                   'assets/spotify_logo.png',
//                   height: 55.0,
//                   filterQuality: FilterQuality.high,
//                 ),
//               ),
//             ],
//           ),
//           _SideMenuIconTab(
//             iconData: Icons.home,
//             title: 'Home',
//             onTap: () {
//               sideBarViewModel.setCurrentPage(const HomeScreen());
//             },
//           ),
//           _SideMenuIconTab(
//             iconData: Icons.shopping_bag,
//             title: 'Order',
//             onTap: () {
//               sideBarViewModel.setCurrentPage(const OrderScreen());
//             },
//           ),
//           _SideMenuIconTab(
//             iconData: Icons.account_box,
//             title: 'Agents',
//             onTap: () {
//               sideBarViewModel.setCurrentPage(const AgentDetails());
//             },
//           ),
//           _SideMenuIconTab(
//             iconData: Icons.person_2,
//             title: 'Internal Agents',
//             onTap: () {
//               sideBarViewModel.setCurrentPage(const InternalAgentPage());
//             },
//           ),
//           _SideMenuIconTab(
//             iconData: Icons.gif_box,
//             title: 'History',
//             onTap: () {
//               sideBarViewModel.setCurrentPage(const HistoryPage());
//             },
//           ),
//           _SideMenuIconTab(
//             iconData: Icons.payment,
//             title: 'Agents H',
//             onTap: () {
//               sideBarViewModel.setCurrentPage(OrderSummary());
//             },
//           ),
//           _SideMenuIconTab(
//             iconData: Icons.payment,
//             title: 'Balance',
//             onTap: () {
//               sideBarViewModel.setCurrentPage(const BalancePage());
//             },
//           ),
//           _SideMenuIconTab(
//             iconData: Icons.person_add_alt_1,
//             title: 'Register Admin',
//             onTap: () {
//               sideBarViewModel.setCurrentPage(const RegisterView());
//             },
//           ),
//           _SideMenuIconTab(
//             iconData: Icons.logout_outlined,
//             title: 'Log out',
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           const SizedBox(height: 12.0),
//         ],
//       ),
//     );
//   }
// }

// class _SideMenuIconTab extends StatefulWidget {
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
//   _SideMenuIconTabState createState() => _SideMenuIconTabState();
// }

// class _SideMenuIconTabState extends State<_SideMenuIconTab> {
//   bool isHovered = false;
//   var _bgColor = Colors.transparent;
//   var _color = Colors.black;
//   double leftPadding = 0;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onHover: (e) {
//         setState(() {
//           isHovered = true;
//           _bgColor = AppColor.whiteColor;
//           _color = const Color(0xFF44F249);
//           leftPadding = 8;
//         });
//       },
//       onExit: (e) {
//         setState(() {
//           isHovered = false;
//           _bgColor = Colors.transparent;
//           _color = Colors.black;
//           leftPadding = 0;
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: AnimatedContainer(
//           alignment: Alignment.centerLeft,
//           duration: const Duration(milliseconds: 40),
//           height: 40,
//           padding: EdgeInsets.only(
//             left: leftPadding,
//           ),
//           decoration: BoxDecoration(
//             color: _bgColor,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: ListTile(
//             leading: Icon(
//               widget.iconData,
//               color: _color,
//               size: 28.0,
//             ),
//             title: Text(
//               widget.title,
//               style: TextStyle(
//                 color: _color,
//               ),
//               overflow: TextOverflow.ellipsis,
//             ),
//             onTap: widget.onTap,
//           ),
//         ),
//       ),
//     );
//   }
// }
