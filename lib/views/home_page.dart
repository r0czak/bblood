import 'package:bblood/viewmodels/blood_level_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bblood/views/user_profile_page.dart';
import 'package:bblood/models/blood_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bblood/models/blood_type.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:stacked/stacked.dart';

import '../services/auth_service.dart';
import '../services/database_service.dart';
import '../widgets/blood_drops_state_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  //final Stream<QuerySnapshot> bloodLevel = FirebaseFirestore.instance.collection('bloodLevels').snapshots();

  //var type = BloodLevelModel().modelFunction('rsf0xWMRrSdITScqa9DZ');

  var type;

  void setType(Future<BloodType> newType){
    this.type = newType;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BloodLevelModel>.reactive(
    viewModelBuilder: () => BloodLevelModel(),
    onModelReady: (model) {
      //BloodType type = model.modelFunction('rsf0xWMRrSdITScqa9DZ') as BloodType;
      setType(model.modelFunction('rsf0xWMRrSdITScqa9DZ'));
    },
    builder: (context, model, child) => Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      body: SingleChildScrollView(
          child: Column(
            children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                            height: 200,
                            child: Image.asset(
                              "images/panel1.png",
                              fit: BoxFit.contain,
                            )),
                        Text("Stany krwi"),
                        SizedBox(),
                        Divider(color: Color(0xFFDA4148)),
                        BloodDropsStateWidget(type),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  ExpansionTileCard(
                    baseColor: Colors.cyan[50],
                    expandedColor: Colors.red[50],
                    leading: CircleAvatar(
                        child: Image.asset("assets/images/devs.jpg")),
                    title: Text("Flutter Dev's"),
                    subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
                    children: <Widget>[
                      Divider(
                        thickness: 1.0,
                        height: 1.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            "FlutterDevs specializes in creating cost-effective and efficient applications with our perfectly crafted,"
                                " creative and leading-edge flutter app development solutions for customers all around the globe.",
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 15,),
                  ExpansionTileCard(
                    baseColor: Colors.cyan[50],
                    expandedColor: Colors.red[50],
                    leading: CircleAvatar(
                        child: Image.asset("assets/images/devs.jpg")),
                    title: Text("Flutter Dev's"),
                    subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
                    children: <Widget>[
                      Divider(
                        thickness: 1.0,
                        height: 1.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            "FlutterDevs specializes in creating cost-effective and efficient applications with our perfectly crafted,"
                                " creative and leading-edge flutter app development solutions for customers all around the globe.",
                          ),
                        ),
                      ),
                    ],
                  ),
              SizedBox(height: 15,),
              ExpansionTileCard(
                baseColor: Colors.cyan[50],
                expandedColor: Colors.red[50],
                leading: CircleAvatar(
                    child: Image.asset("assets/images/devs.jpg")),
                title: Text("Flutter Dev's"),
                subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
                children: <Widget>[
                  Divider(
                    thickness: 1.0,
                    height: 1.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        "FlutterDevs specializes in creating cost-effective and efficient applications with our perfectly crafted,"
                            " creative and leading-edge flutter app development solutions for customers all around the globe.",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    ),
    );
  }
}



