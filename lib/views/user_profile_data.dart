import 'package:bblood/models/user_model.dart';
import 'package:bblood/viewmodels/user_profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../locator.dart';
import '../services/auth_service.dart';
import '../views/honory_card_page.dart';

class UserProfileData extends StatefulWidget {
  const UserProfileData({Key? key}) : super(key: key);

  @override
  _UserProfileDataState createState() => _UserProfileDataState();
}

class _UserProfileDataState extends State<UserProfileData> {
  late User user;

  var items = ['A Rh+', 'A Rh-', 'B Rh+', 'B Rh-', 'AB Rh+', 'AB Rh-', '0 Rh+', '0 Rh-'];
  String? _selectedBloodType;
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileModel>.reactive(
      viewModelBuilder: () => UserProfileModel(),
      onModelReady: (model) async {
        user = await model.getUser();
      },
      builder: (context, model, child) => Scaffold(
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
        padding: EdgeInsets.all(15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Card(
                elevation: 5,
                child: ListTile(
                  title: Text("Jan Kowalski", style: TextStyle(fontSize: 24)),
                ),
              ),
              const SizedBox(height: 20),
              //user data here:
              UserInformationContainer("12.01.1999", "123456789", "user.peselNumber!", "jan@mail.com"),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Ustaw swoją grupę krwi: "),
                  Expanded(
                    child: IgnorePointer(
                      ignoring: false,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        items: items.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item, style: TextStyle(fontSize: 14)),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _selectedBloodType = value;
                          });
                        },
                        value: _selectedBloodType,
                      ),
                    ),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFDA4148),
                    child: MaterialButton(
                      padding: const EdgeInsets.all(15),
                      onPressed: () {
                        setBloodType();
                      },
                      child: const Text(
                        "Zapisz",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
      )
    );
  }

  void setBloodType(){
    setState(() {
      state = true;
    });
    //state = true;
  }

  Widget UserInformationContainer(String birthday, String phone, String personalNumber, String email){
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Informacje konta dawcy", style: TextStyle(fontSize: 18)),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    title: Text(birthday),
                    subtitle: Text("Data urodzenia"),
                    leading: Icon(Icons.calendar_today_outlined, color: Colors.red),
                  ),
                  //Divider(thickness: 1),
                  ListTile(
                    title: Text(phone),
                    subtitle: Text("Telefon"),
                    leading: Icon(Icons.phone, color: Colors.green),
                  ),
                  ListTile(
                    title: Text(email),
                    subtitle: Text("E-mail"),
                    leading: Icon(Icons.email, color: Colors.deepPurple),
                  ),
                  //Divider(thickness: 1),
                  ListTile(
                    title: Text(personalNumber),
                    subtitle: Text("Pesel"),
                    leading: Icon(Icons.person, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
