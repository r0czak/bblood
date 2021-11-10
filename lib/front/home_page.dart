import 'package:flutter/cupertino.dart';
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
    return Scaffold(
      //backgroundColor: const Color(0xFFDA4148),
      backgroundColor: const Color(0xFFEDEDED),
      body: Center(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Column(children: <Widget>[
                  SizedBox(
                      height: 200,
                      child: Image.asset(
                        "images/panel1.png",
                        fit: BoxFit.contain,
                      )),
                  SizedBox(
                      height: 300,
                      child: Image.asset(
                        "images/panel2.png",
                        fit: BoxFit.contain,
                      )),
                ]),
              ),
            ],
          ),
        ),
    );
  }
}
