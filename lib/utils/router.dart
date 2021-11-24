import 'package:bblood/views/menu_controller.dart';
import 'package:flutter/material.dart';

import '../views/login_page.dart';
import '../views/registration_page.dart';
import '../views/user_profile_page.dart';
import '../wrapper.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Wrapper());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const MenuController());
      case '/profile':
        return MaterialPageRoute(builder: (_) => UserProfileScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
