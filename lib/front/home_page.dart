import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bblood/front/user_profile_page.dart';

import '../services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      //backgroundColor: const Color(0xFFDA4148),
      backgroundColor: const Color(0xFFEDEDED),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFEDEDED),
            child: Padding(
              padding: const EdgeInsets.all(45.0),
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  Text("Menu główne"),
                  ElevatedButton(
                    child: const Text('Logout'),
                    onPressed: () async {
                      await authService.signOut();
                    },
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
