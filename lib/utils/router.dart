import 'package:bblood/views/menu_controller.dart';
import 'package:flutter/material.dart';

import '../views/login_page.dart';
import '../views/registration_page.dart';
import '../views/user_profile_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/login':
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const LoginScreen(),
      );
    case '/register':
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const RegistrationScreen(),
      );
    case '/home':
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: MenuController(),
      );
    case '/profile':
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: UserProfileScreen(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute(
    {required String routeName, required Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}

// class Router {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => const StartUpView());
//       case '/login':
//         return MaterialPageRoute(builder: (_) => const LoginScreen());
//       case '/home':
//         return MaterialPageRoute(builder: (_) => const MenuController());
//       case '/profile':
//         return MaterialPageRoute(builder: (_) => const UserProfileScreen());
//       case '/register':
//         return MaterialPageRoute(builder: (_) => const RegistrationScreen());
//       default:
//         return MaterialPageRoute(
//             builder: (_) => Scaffold(
//                   body: Center(
//                       child: Text('No route defined for ${settings.name}')),
//                 ));
//     }
//   }
// }
