import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/view_model/ad_management_view_Model.dart';
import 'package:unity_admin/view_model/blog_section_view_model.dart';
import 'package:unity_admin/view_model/category_view_model.dart';
import 'package:unity_admin/view_model/dashboard_view_model.dart';
import 'package:unity_admin/view_model/page_section_view_Model.dart';
import 'package:unity_admin/view_model/user_manage_view_model.dart';
import 'core/routes/router_generator.dart';
import 'core/routes/routes_name.dart';
import 'core/theme/app_color.dart';
import 'view_model/add_post_view_model.dart';
import 'view_model/login_signup_view_model.dart';
import 'package:google_fonts/google_fonts.dart';

import 'view_model/post_verify_view_model.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),
        ChangeNotifierProvider<RegisterViewModel>(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider<LogOutViewModel>(create: (_) => LogOutViewModel()),
        ChangeNotifierProvider<CategoryViewModel>(create: (_) => CategoryViewModel()),
        ChangeNotifierProvider<AddPostViewModel>(create: (_) => AddPostViewModel()),
        ChangeNotifierProvider<PageSectionViewModel>(create: (_) => PageSectionViewModel()),
        ChangeNotifierProvider<BlogSectionViewModel>(create: (_) => BlogSectionViewModel()),
        ChangeNotifierProvider<UserViewModel>(create: (_) => UserViewModel()),
        ChangeNotifierProvider<AdsViewModel>(create: (_) => AdsViewModel()),
        ChangeNotifierProvider<PostVerificationViewModel>(create: (_) => PostVerificationViewModel()),
        ChangeNotifierProvider<DashboardViewModel>(create: (_) => DashboardViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: ' Unity Aid Hub ',
        darkTheme: ThemeData(
          // brightness: Brightness.dark,

          appBarTheme: AppBarTheme(
              iconTheme: const IconThemeData().copyWith(color: AppColor.darkColor),
              // backgroundColor: Colors.white,
              titleTextStyle: GoogleFonts.anton(
                color: AppColor.whiteColor,
              )),
          scaffoldBackgroundColor: AppColor.greyColor,
          // backgroundColor: const Color(0xFF121212),
          primaryColor: AppColor.darkColor,
          // // accentColor: const Color(0xFF1DB954),
          iconTheme: const IconThemeData().copyWith(color: AppColor.darkColor),
          fontFamily: 'Montserrat',
          textTheme: TextTheme(
            displayMedium: GoogleFonts.anton(
              color: AppColor.darkColor,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
            headlineMedium: TextStyle(
              fontSize: 12.0,
              color: AppColor.darkColor,
              fontWeight: FontWeight.w500,
              letterSpacing: 2.0,
            ),
            bodyLarge: TextStyle(
              color: AppColor.darkColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
            bodyMedium: TextStyle(
              color: AppColor.darkColor,
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
      ),
    );
  }
}
