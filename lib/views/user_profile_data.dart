import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../locator.dart';
import '../services/auth_service.dart';
import '../views/honory_card_page.dart';

class UserProfileData extends StatefulWidget {
  const UserProfileData({Key? key}) : super(key: key);

  @override
  _UserProfileDataState createState() => _UserProfileDataState();
}

class _UserProfileDataState extends State<UserProfileData> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dane użytkownika"),
        backgroundColor: Color(0xFFDA4148),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 35.0,
                ),
              )),
        ],
      ),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Card(
                elevation: 7,
                margin: EdgeInsets.all(15),
                child: ListTile(
                  title: Text("Jan Kowalski", style: TextStyle(fontSize: 24)),
                  trailing: Icon(Icons.edit),
                ),
              ),
            ]),
      ),
    );
  }
}
