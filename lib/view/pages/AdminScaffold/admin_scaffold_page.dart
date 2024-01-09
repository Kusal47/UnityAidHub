import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/view_model/login_signup_view_model.dart';
import '../../../core/const/assets_path.dart';
import '../../../core/routes/routes_name.dart';
import '../../../core/theme/app_color.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    Key? key,
    required this.route,
    required this.body,
  }) : super(key: key);

  final Widget body;
  final String route;
  final List<AdminMenuItem> _sideBarItems = const [
    AdminMenuItem(
      title: 'Dashboard',
      route: RouteName.dashboard,
      icon: Icons.dashboard,
    ),
    AdminMenuItem(
      title: 'Category',
      route: RouteName.category,
      icon: Icons.category,
    ),
    AdminMenuItem(
      title: 'User Management',
      route: RouteName.usermanagement,
      icon: CupertinoIcons.group_solid,
    ),
    AdminMenuItem(
      title: 'Roles Management',
      route: RouteName.rolesmanagement,
      icon: CupertinoIcons.settings_solid
    ),
    AdminMenuItem(
      title: 'Post Verification',
      route: RouteName.postverify,
      icon: Icons.verified,
    ),
    AdminMenuItem(
      title: 'Add Post',
      route: RouteName.postadd,
      icon: Icons.post_add,
    ),
    AdminMenuItem(
      title: 'Ads Management',
      route: RouteName.adsmanagement,
      icon: Icons.ads_click,
    ),
    AdminMenuItem(
      title: 'Comments',
      route: RouteName.comments,
      icon: Icons.comment_rounded,
    ),
    AdminMenuItem(
      title: 'Page Section',
      route: RouteName.pagesection,
      icon: CupertinoIcons.news_solid,
    ),
    AdminMenuItem(
      title: 'Blog',
      route: RouteName.blogs,
      icon: Icons.mobile_screen_share_rounded,
    ),
    AdminMenuItem(
      title: 'Register',
      route: RouteName.register,
      icon: CupertinoIcons.person_add_solid,
    ),
  ];

  final List<AdminMenuItem> _adminMenuItems = const [
    AdminMenuItem(
      title: 'User Profile',
      icon: Icons.account_circle,
      route: '/dashboard',
    ),
    AdminMenuItem(
      title: 'Settings',
      icon: Icons.settings,
      route: '/dashboard',
    ),
    AdminMenuItem(
      title: 'Logout',
      icon: Icons.logout,
      route: RouteName.login,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final viewModel = Provider.of<LogOutViewModel>(context);
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: AdminScaffold(
        backgroundColor: AppColor.greyColor,
        appBar: AppBar(
          elevation: 20,
          toolbarHeight: 80,
          title: Image.asset(
            AssetsPath.landscapedarklogo,
            filterQuality: FilterQuality.high,
            height: 70,
          ),
          backgroundColor: AppColor.secondaryColor,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PopupMenuButton<AdminMenuItem>(
                icon: const Icon(
                  Icons.account_circle,
                  // color: AppColor.whiteColor,
                ),
                iconSize: 30,
                itemBuilder: (context) {
                  return _adminMenuItems.map((AdminMenuItem item) {
                    return PopupMenuItem<AdminMenuItem>(
                      value: item,
                      child: Row(
                        children: [
                          Icon(
                            item.icon,
                            color: AppColor.darkColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList();
                },
                onSelected: (item) {
                  print(
                      'actions: onSelected(): title = ${item.title}, route = ${item.route}');
                  if (item.title == 'Logout') {
                    viewModel.logoutUser(context);
                  }
                  Navigator.of(context).pushNamed(item.route!);
                },
              ),
            ),
          ],
        ),
        sideBar: SideBar(
          backgroundColor: AppColor.secondaryColor,
          activeBackgroundColor: AppColor.greyColor,
          borderColor: AppColor.whiteColor,
          iconColor: AppColor.darkColor,
          activeIconColor: AppColor.darkColor,
          textStyle: TextStyle(
            color: AppColor.darkColor,
            fontSize: 14,
            fontWeight: FontWeight.w600
          ),
          activeTextStyle: TextStyle(
            color: AppColor.darkColor,
            fontSize: 14,
            fontWeight: FontWeight.w600
          ),
          items: _sideBarItems,
          selectedRoute: route,
          onSelected: (item) {
            print(
                'sideBar: onTap(): title = ${item.title}, route = ${item.route}');
            if (item.route != null && item.route != route) {
              Navigator.of(context).pushNamed(item.route!);
            }
          },
        ),
        body: SingleChildScrollView(
          child: body,
        ),
      ),
    );
  }
}
