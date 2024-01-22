import 'package:flutter/material.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import 'package:unity_admin/view/home_screen/home_screen.dart';
import 'package:unity_admin/view/pages/auth/register_page.dart';
import '../../view/pages/auth/login_page.dart';
import '../../view/pages/view_Pages/add_post.dart';
import '../../view/pages/view_Pages/ads_management.dart';
import '../../view/pages/view_Pages/blog_section.dart';
import '../../view/pages/view_Pages/category.dart';
import '../../view/pages/view_Pages/pages_section.dart';
import '../../view/pages/view_Pages/post_verification.dart';
import '../../view/pages/view_Pages/user_management.dart';
// import '../../view/pages/view_Pages/roles_management.dart';
// import '../../view/pages/view_Pages/comments_crud.dart';

  Widget? generateRoutes(RouteSettings settings) {
     final uri = Uri.parse(settings.name!);
    switch (uri.path) {
      case RouteName.login:
        return  const LoginPage();

      case RouteName.dashboard:
        return const HomeScreen();

      case RouteName.usermanagement:
        return  const UserManagement();

      // case RouteName.rolesmanagement:
      //   return  const RolesManagement();

      case RouteName.postverify:
        return  const PostVerification();
      
      case RouteName.postadd:
        return  const AddPost();

      case RouteName.adsmanagement:
        return  const AdsManagement();

      case RouteName.category:
        return  const CategoryPage();

      // case RouteName.comments:
      //   return  const CommentCRUD();

      case RouteName.pagesection:
        return  const PagesSection();

      case RouteName.blogs:
        return  const BlogSection();

      case RouteName.register:
        return  const RegisterView();

      default:
        return Scaffold(
          body: Center(
            child: Text("No Route Defined for ${settings.name}"),
          ),
        );
    }
  }









// import 'package:flutter/material.dart';

// import 'package:unity_admin/core/routes/routes_name.dart';
// import 'package:unity_admin/view/pages/auth/register_page.dart';

// import '../../view/agent_view/agent_detail.dart';
// import '../../view/balance/balance_page.dart';
// import '../../view/history/history_page.dart';
// import '../../view/order_screen/order_screen.dart';
// import '../../view/pages/auth/login_page.dart';
// import '../../view/pages/sidebar_pages/shell_screen.dart';

// class Routes {
//   static Route<dynamic> generateRoutes(RouteSettings settings) {
//     switch (settings.name) {
//       case RouteName.login:
//         return MaterialPageRoute(builder: (context) => const LoginPage());

//       case RouteName.shell:
//         return MaterialPageRoute(builder: (context) => ShellScreen());

//       case RouteName.order:
//         return MaterialPageRoute(builder: (context) => const OrderScreen());

//       case RouteName.history:
//         return MaterialPageRoute(builder: (context) => const HistoryPage());

//       case RouteName.result:
//         return MaterialPageRoute(builder: (context) => const RegisterView());
//       case RouteName.balance:
//         return MaterialPageRoute(builder: (context) => const BalancePage());


//       case RouteName.agent:
//         return MaterialPageRoute(builder: (context) => const AgentDetails());
//       default:
//         return MaterialPageRoute(
//           builder: (BuildContext context) => Scaffold(
//             body: Center(
//               child: Text("No Route Defined for ${settings.name}"),
//             ),
//           ),
//         );
//     }
//   }
// }





