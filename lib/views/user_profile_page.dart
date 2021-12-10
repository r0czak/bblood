import 'package:bblood/enums/view_state.dart';
import 'package:bblood/models/locations_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../locator.dart';
import '../services/auth_service.dart';
import '../viewmodels/user_profile_view_model.dart';
import '../views/honorary_card_page.dart';
import '../views/user_profile_data.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  var _toggled = false;
  var _toggled2 = false;

  final authService = locator<AuthService>();

  late List<LocationsModel> locations;
  LocationsModel? _selectedLocation;

  @override
  Widget build(BuildContext context) {
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

    return ViewModelBuilder<UserProfileModel>.reactive(
      viewModelBuilder: () => UserProfileModel(),
      onModelReady: (model) async {
        await model.readLocations();
        locations = model.getLocations();
        if (await model.isLocationSet()) {
          String locationName = await model.getUserLocation();
          _selectedLocation =
              locations.where((element) => element.name == locationName).first;
        }
      },
      builder: (context, model, child) => Scaffold(
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
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 15),
              honorCard,
              SizedBox(height: 25),
              Text("Ustawienia"),
              Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(10),
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
                            MaterialPageRoute(
                                builder: (context) => UserProfileData()),
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
                        leading: Icon(Icons.settings, color: Color(0xFFDA4148)),
                        title: Text("Ustawienia konta"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //change password, emails etc.
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                      const ListTile(
                        leading:
                            Icon(Icons.location_on, color: Color(0xFFDA4148)),
                        title: Text("Wybierz swój punkt RCKiK"),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: model.state == ViewState.busy
                            ? const Center(child: CircularProgressIndicator())
                            : DropdownButton<LocationsModel>(
                                value: _selectedLocation,
                                isExpanded: true,
                                items: locations.map((LocationsModel location) {
                                  return DropdownMenuItem<LocationsModel>(
                                    value: location,
                                    child: Text(
                                      location.name,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (LocationsModel? value) {
                                  setState(() {
                                    _selectedLocation = value;
                                    model.updateUserLocation(
                                        _selectedLocation!.name);
                                  });
                                },
                              ),
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
