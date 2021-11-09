import 'package:bblood/model/user_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  User? user = FirebaseAuth.instance.currentUser;
  UserInfoModel userData = UserInfoModel();

  /*
  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
      .collection("users")
      .doc(user!.uid)
      .get()
      .then((value) {
        userData = UserInfoModel.fromMap(value.data());
        setState(() {});
      });
  }

   */

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    final honorCard = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xFFDA4148),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
        onPressed: () {},
        child: const Text(
          "Karta honorowego dawcy krwi",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      //backgroundColor: const Color(0xFFDA4148),
      backgroundColor: const Color(0xFFEDEDED),
      appBar: AppBar(
        title: const Text("Bbold"),
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
              )
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            color: const Color(0xFFEDEDED),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Profil użytkownika"),
                  Card(
                    color: Colors.grey[300],
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        height: 200,
                        width: 400,
                        child:  Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                              radius: 70, //we give the image a radius of 50
                              backgroundImage: NetworkImage(
                                  'https://webstockreview.net/images/male-clipart-professional-man-3.jpg'),
                            ),
                            Text(
                              "123",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                  ),
                  SizedBox(height: 100),
                  honorCard,
                  SizedBox(height: 100),
                  ElevatedButton(
                    child: const Text('Wyloguj'),
                    onPressed: () async {
                      await authService.signOut();
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }

}