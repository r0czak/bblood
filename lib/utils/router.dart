import 'package:bblood/front/menu_controller.dart';
import 'package:flutter/material.dart';

import '../front/login_page.dart';
import '../front/registration_page.dart';
import '../front/user_profile_page.dart';
import '../wrapper.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Wrapper());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => MenuController());
      case '/profile':
        return MaterialPageRoute(builder: (_) => UserProfileScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
