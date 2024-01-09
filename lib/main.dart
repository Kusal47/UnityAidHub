import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/view_model/category_view_model.dart';
import 'core/routes/router_generator.dart';
import 'core/routes/routes_name.dart';
import 'core/theme/app_color.dart';
import 'view_model/login_signup_view_model.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(
              create: (_) => LoginViewModel()),
        ChangeNotifierProvider<RegisterViewModel>(
              create: (_) => RegisterViewModel()),
        ChangeNotifierProvider<LogOutViewModel>(
              create: (_) => LogOutViewModel()),
        ChangeNotifierProvider<CategoryViewModel>(
              create: (_) => CategoryViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: ' Unity Aid Hub ',
        darkTheme: ThemeData(
          // brightness: Brightness.dark,
    
          appBarTheme: AppBarTheme(
              iconTheme: const IconThemeData().copyWith(color: AppColor.darkColor),
              // backgroundColor: Colors.white,
              titleTextStyle:  TextStyle(
                color: AppColor.whiteColor,
                fontFamily: 'Montserrat',
              )),
          scaffoldBackgroundColor: AppColor.greyColor,
          // backgroundColor: const Color(0xFF121212),
          primaryColor: AppColor.darkColor,
          // // accentColor: const Color(0xFF1DB954),
          iconTheme: const IconThemeData().copyWith(color:  AppColor.darkColor),
          fontFamily: 'Montserrat',
          textTheme:  TextTheme(
            headline2: TextStyle(
              color:  AppColor.darkColor,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
            headline4: TextStyle(
              fontSize: 12.0,
              color:  AppColor.darkColor,
              fontWeight: FontWeight.w500,
              letterSpacing: 2.0,
            ),
            bodyText1: TextStyle(
              color:  AppColor.darkColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
            bodyText2: TextStyle(
              color:  AppColor.darkColor,
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