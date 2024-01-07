import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:unity_admin/core/const/assets_path.dart';
import 'package:unity_admin/view/pages/auth/login_page.dart';
import 'package:unity_admin/view/pages/auth/register_page.dart';

import 'core/routes/router_generator.dart';
import 'core/routes/routes_name.dart';
import 'core/theme/app_color.dart';
import 'utils/text_design.dart';
import 'view/home_screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Unity Aid Hub ',
      darkTheme: ThemeData(
        // brightness: Brightness.dark,

        appBarTheme: AppBarTheme(
            iconTheme: const IconThemeData().copyWith(color: Colors.black),
            // backgroundColor: Colors.white,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
            )),
        // scaffoldBackgroundColor: const Color(0xFF121212),
        // backgroundColor: const Color(0xFF121212),
        primaryColor: Colors.black,
        // // accentColor: const Color(0xFF1DB954),
        iconTheme: const IconThemeData().copyWith(color: Colors.black),
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          headline2: TextStyle(
            color: Colors.black,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 12.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
          ),
          bodyText1: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
          bodyText2: TextStyle(
            color: Colors.black,
            letterSpacing: 1.0,
          ),
        ),
      ),
      initialRoute: RouteName.login,
      onGenerateRoute: (settings) {
        final page = generateRoutes(settings);
        if (page != null) {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => page,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(
                  opacity: anim,
                  child: child,
                );
              });
        }
        return null;
      },
    );
  }

  // Widget? _getPageWidget(RouteSettings settings) {
  //   if (settings.name == null) {
  //     return null;
  //   }
  //   final uri = Uri.parse(settings.name!);
  //   switch (uri.path) {
  //     case '/':
  //       return LoginPage();
  //     case '/login':
  //       return LoginPage();
  //     case '/dashboard':
  //       return HomeScreen();
  //     case '/register':
  //       return RegisterView();
  //     // case '/thirdLevelItem1':
  //     //   return ThirdLevelItem1Page();
  //     // case '/thirdLevelItem2':
  //     //   return ThirdLevelItem2Page();
  //   }
  //   return null;
  // }
}

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
      icon: Icons.person_pin_sharp,
    ),
    AdminMenuItem(
      title: 'Roles Management',
      route: RouteName.rolesmanagement,
      icon: Icons.person_pin_sharp,
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
      icon: Icons.pages,
    ),
    AdminMenuItem(
      title: 'Blog',
      route: RouteName.blogs,
      icon: Icons.mobile_screen_share_rounded,
    ),
    AdminMenuItem(
      title: 'Register',
      route: RouteName.register,
      icon: Icons.person_add_alt_1,
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

    print('width is $screenWidth');
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: AdminScaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 20,
          toolbarHeight: 70,
          title: screenWidth <= 600
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                    AssetsPath.portraitlogo,
                    filterQuality: FilterQuality.high,
                    height: 70,
                  ),
              )
              : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                    AssetsPath.landscapelogo,
                    filterQuality: FilterQuality.high,
                    height: 60,
                  ),
              ),
          backgroundColor: AppColor.secondaryColor,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PopupMenuButton<AdminMenuItem>(
                child: const Icon(
                  Icons.account_circle,
                  // color: AppColor.whiteColor,
                  size: 30,
                ),
                itemBuilder: (context) {
                  return _adminMenuItems.map((AdminMenuItem item) {
                    return PopupMenuItem<AdminMenuItem>(
                      value: item,
                      child: Row(
                        children: [
                          Icon(
                            item.icon,
                            color: Colors.black,
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
                  Navigator.of(context).pushNamed(item.route!);
                },
              ),
            ),
          ],
        ),
        sideBar: SideBar(
          backgroundColor: AppColor.secondaryColor,
          activeBackgroundColor: AppColor.whiteColor,
          borderColor: const Color(0xFFE7E7E7),
          iconColor: Colors.black,
          activeIconColor: AppColor.secondaryColor,
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          activeTextStyle: TextStyle(
            color: AppColor.secondaryColor,
            fontSize: 14,
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
          // header: Container(
          //   height: 50,
          //   width: double.infinity,
          //   color: const Color(0xff444444),
          //   child: const Center(
          //     child: Text(
          //       'header',
          //       style: TextStyle(
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
          // footer: Container(
          //   height: 50,
          //   width: double.infinity,
          //   color: const Color(0xff444444),
          //   child: const Center(
          //     child: Text(
          //       'footer',
          //       style: TextStyle(
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
        ),
        body: SingleChildScrollView(
          child: body,
        ),
      ),
    );
  }
}



// import 'package:desktop_window/desktop_window.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:provider/provider.dart';
// import 'package:unity_admin/locator.dart';
// import 'core/routes/router_generator.dart';
// import 'core/routes/routes_name.dart';
// import 'view_model/sidebar_view_model.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
//     await DesktopWindow.setMinWindowSize(const Size(600, 800));
//   }
//   setup();

//   runApp(
//     MyApp(),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => SideBarViewModel()),
//       ],
//       child: MaterialApp(
//         title: 'Unity Aid Hub',
//         debugShowCheckedModeBanner: false,
//         darkTheme: ThemeData(
//           // brightness: Brightness.dark,

//           appBarTheme: AppBarTheme(
//               iconTheme: const IconThemeData().copyWith(color: Colors.black),
//               backgroundColor: Colors.white,
//               titleTextStyle: const TextStyle(
//                 color: Colors.black,
//                 fontFamily: 'Montserrat',
//               )),
//           // scaffoldBackgroundColor: const Color(0xFF121212),
//           // backgroundColor: const Color(0xFF121212),
//           primaryColor: Colors.black,
//           // // accentColor: const Color(0xFF1DB954),
//           iconTheme: const IconThemeData().copyWith(color: Colors.black),
//           fontFamily: 'Montserrat',
//           textTheme: const TextTheme(
//             headline2: TextStyle(
//               color: Colors.black,
//               fontSize: 32.0,
//               fontWeight: FontWeight.bold,
//             ),
//             headline4: TextStyle(
//               fontSize: 12.0,
//               color: Colors.black,
//               fontWeight: FontWeight.w500,
//               letterSpacing: 2.0,
//             ),
//             bodyText1: TextStyle(
//               color: Colors.black,
//               fontSize: 14.0,
//               fontWeight: FontWeight.w600,
//               letterSpacing: 1.0,
//             ),
//             bodyText2: TextStyle(
//               color: Colors.black,
//               letterSpacing: 1.0,
//             ),
//           ),
//         ),
//         initialRoute: RouteName.login,
//         onGenerateRoute: Routes.generateRoutes,
//         // home: sum
//       ),
//     );
//   }
// }