import 'package:flutter/material.dart';
import 'package:devicelocale/devicelocale.dart';
import 'dart:async';

class ResearchScreen extends StatefulWidget {
  const ResearchScreen({Key? key}) : super(key: key);

  @override
  _ResearchScreenState createState() => _ResearchScreenState();
}

class _ResearchScreenState extends State<ResearchScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _location;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: const Color(0xFFDA4148),
      backgroundColor: const Color(0xFFEDEDED),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFEDEDED),
            child: Padding(
              padding: const EdgeInsets.all(45.0),
              //child: Form(
                //key: _formKey,
                child: Column(
                    children: const <Widget>[
                      Text("Badania")
                    ]
                ),
              ),
            ),
          ),
        ),
      //),
    );
  }
}
