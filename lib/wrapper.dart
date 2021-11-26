// import 'package:bblood/models/user_model.dart';
// import 'package:bblood/services/auth_service.dart';
// import 'package:flutter/material.dart';
//
// import 'locator.dart';
// import 'views/login_page.dart';
// import 'views/menu_controller.dart';
//
// class Wrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final authService = locator<AuthService>();
//
//     return StreamBuilder<User?>(
//         stream: authService.user,
//         builder: (_, AsyncSnapshot<User?> snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             final User? user = snapshot.data;
//             return user == null ? LoginScreen() : MenuController();
//           } else {
//             return const Scaffold(
//                 body: Center(
//               child: CircularProgressIndicator(),
//             ));
//           }
//         });
//   }
// }
