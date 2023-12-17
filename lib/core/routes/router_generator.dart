import 'package:flutter/material.dart';

import 'package:unity_admin/core/routes/routes_name.dart';

import '../../view/agent_view/agent_detail.dart';
import '../../view/balance/balance_page.dart';
import '../../view/history/history_page.dart';
import '../../view/order_screen/order_screen.dart';
import '../../view/pages/auth/login_page.dart';
import '../../view/pages/sidebar_pages/shell_screen.dart';
import '../../view/result_screen/result_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.login:
        return MaterialPageRoute(builder: (context) => const LoginPage());

      case RouteName.shell:
        return MaterialPageRoute(builder: (context) => ShellScreen());

      case RouteName.order:
        return MaterialPageRoute(builder: (context) => OrderScreen());

      case RouteName.history:
        return MaterialPageRoute(builder: (context) => HistoryPage());

      case RouteName.result:
        return MaterialPageRoute(builder: (context) => ResultPage());
      case RouteName.balance:
        return MaterialPageRoute(builder: (context) => BalancePage());


      case RouteName.agent:
        return MaterialPageRoute(builder: (context) => AgentDetails());
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text("No Route Defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
