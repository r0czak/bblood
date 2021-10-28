import 'package:flutter/material.dart';

class BloodCardScreen extends StatefulWidget {
  const BloodCardScreen({Key? key}) : super(key: key);

  @override
  _BloodCardScreenState createState() => _BloodCardScreenState();
}

class _BloodCardScreenState extends State<BloodCardScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: const Color(0xFFDA4148),
      backgroundColor: const Color(0xFFEDEDED),
      appBar: AppBar(
        title: const Text("Bbold"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFEDEDED),
            child: Padding(
              padding: const EdgeInsets.all(45.0),
              child: Form(
                key: _formKey,
                child: Column(
                    children: <Widget>[
                      Text("Dane oddawanej krwi")
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
