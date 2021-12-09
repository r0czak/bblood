import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../locator.dart';
import '../services/auth_service.dart';
import '../views/honory_card_page.dart';
import '../views/user_profile_data.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  /*
  User? user = FirebaseAuth.instance.currentUser;
  UserInfoModel userData = UserInfoModel();

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
  var _toggled = false;
  var _toggled2 = false;

  @override
  Widget build(BuildContext context) {
    final authService = locator<AuthService>();

    final honorCard = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xFFDA4148),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HonoryCardScreen()),
          );
        },
        child: const Text(
          "Karta honorowego dawcy krwi",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );

    final logoutButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xFFDA4148),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        onPressed: () async {
          await authService.signOut();
          Navigator.pushNamed(context, '/');
        },
        child: const Text(
          "Wyloguj",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      //backgroundColor: const Color(0xFFDA4148),
      backgroundColor: const Color(0xFFEDEDED),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profil dawcy"),
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
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Card(
                elevation: 7,
                margin: const EdgeInsets.all(15),
                child: ListTile(
                  title: Text("Jan Kowalski", style: TextStyle(fontSize: 24)),
                  trailing: Icon(Icons.edit),
                ),
              ),
              honorCard,
              SizedBox(height: 25),
              Text("Ustawienia"),
              Card(
                  elevation: 4,
                  margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.person, color: Color(0xFFDA4148)),
                        title: Text("Dane szczegółowe dawcy"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserProfileData()),
                          );
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                      ListTile(
                        leading:
                            Icon(Icons.location_on, color: Color(0xFFDA4148)),
                        title: Text("Zmień lokalizację"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //create localization type
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                      ListTile(
                        leading: Icon(Icons.settings, color: Color(0xFFDA4148)),
                        title: Text("Ustawienia konta"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //change password, emails etc.
                        },
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              Text("Notyfikacje"),
              SwitchListTile(
                value: _toggled,
                title: Text("Powiadomienia donacji krwi"),
                onChanged: (bool value) {
                  setState(() => _toggled = value);
                },
              ),
              SwitchListTile(
                value: _toggled2,
                title: Text("Powiadomienia o bonusach dla dawców"),
                onChanged: (bool value) {
                  setState(() => _toggled2 = value);
                },
              ),
              const SizedBox(height: 30),
              logoutButton,
            ]),
      ),
    );
  }
}
