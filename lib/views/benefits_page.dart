import 'package:flutter/material.dart';

class BenefitsScreen extends StatefulWidget {
  const BenefitsScreen({Key? key}) : super(key: key);

  @override
  _BenefitsScreenState createState() => _BenefitsScreenState();
}

class _BenefitsScreenState extends State<BenefitsScreen> {
  final _formKey = GlobalKey<FormState>();

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
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                    children: <Widget>[
                      Text("Znizki i ulgi dla krwiodawcow")
                    ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}