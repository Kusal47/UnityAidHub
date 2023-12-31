import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/locator.dart';


import 'core/routes/router_generator.dart';
import 'core/routes/routes_name.dart';
import 'core/theme/app_color.dart';
import 'view_model/sidebar_view_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(const Size(600, 800));
  }
  setup();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(create: (_) => SideBarViewModel()),
      
      
      ],
      child: MaterialApp(
        title: 'Flutter  UI',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
          // brightness: Brightness.dark,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    AppColor.createMaterialColor(AppColor.blackColor),
                  ),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(
                      color: Colors.black, // Change to your desired text color
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                      AppColor.createMaterialColor(AppColor.primaryColor)))),
          appBarTheme: AppBarTheme(
              iconTheme: const IconThemeData().copyWith(color: Colors.black),
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
              )),
          // scaffoldBackgroundColor: const Color(0xFF121212),
          // backgroundColor: const Color(0xFF121212),
          primaryColor: Colors.black,
          // // accentColor: const Color(0xFF1DB954),
          iconTheme: const IconThemeData().copyWith(color: Colors.black),
          fontFamily: 'Montserrat',
          textTheme: TextTheme(
            headline2: const TextStyle(
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
        onGenerateRoute: Routes.generateRoutes,
        // home: sum
      ),
    );
  }
}
