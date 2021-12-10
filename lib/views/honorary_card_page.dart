import 'package:bblood/enums/view_state.dart';
import 'package:bblood/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../viewmodels/honorary_card_view_model.dart';

class HonoryCardScreen extends StatefulWidget {
  const HonoryCardScreen({Key? key}) : super(key: key);

  @override
  _HonoryCardScreenState createState() => _HonoryCardScreenState();
}

class _HonoryCardScreenState extends State<HonoryCardScreen> {
  User? user;
  String? _selectedBloodType;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HonoraryCardViewModel>.reactive(
        viewModelBuilder: () => HonoraryCardViewModel(),
        onModelReady: (model) async {
          user = await model.getUser();
          String tempBloodType = await model.getUserBloodType();
          if (tempBloodType.isNotEmpty) {
            _selectedBloodType = tempBloodType;
          }
        },
        builder: (context, model, child) => Scaffold(
              //backgroundColor: const Color(0xFFDA4148),
              backgroundColor: const Color(0xFFEDEDED),
              appBar: AppBar(
                centerTitle: true,
                title: const Text("Honorowy dawca"),
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
              body: Center(
                child: Container(
                  width: 400,
                  height: 700,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/blood_logo_2reg.png'),
                      colorFilter: ColorFilter.mode(
                          Color(0xFFEDEDED).withOpacity(0.8),
                          BlendMode.srcOver),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CircleAvatar(
                              radius: 70, //we give the image a radius of 50
                              backgroundImage: NetworkImage(
                                  'https://webstockreview.net/images/male-clipart-professional-man-3.jpg'),
                            ),
                            model.state == ViewState.idle
                                ? Text(user!.firstName! + " " + user!.lastName!,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold))
                                : const Text(""),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text("Legitymacja zasłużonego dawcy krwi",
                            style: TextStyle(
                                color: Color(0xFFDA4148), fontSize: 20)),
                        const SizedBox(height: 20),
                        const Text("- Data urodzenia -"),
                        model.state == ViewState.idle
                            ? Text(
                                "  " +
                                    model
                                        .dateToString(user!.birthday!.toDate()),
                                style: const TextStyle(fontSize: 17))
                            : const Text(""),
                        const SizedBox(height: 10),
                        const Text("- Pesel -"),
                        model.state == ViewState.idle
                            ? Text("  " + user!.peselNumber!,
                                style: const TextStyle(fontSize: 17))
                            : const Text(""),
                        const SizedBox(height: 10),
                        const Text("- Grupa krwi -"),
                        model.state == ViewState.idle &&
                                _selectedBloodType != null
                            ? Text("  " + _selectedBloodType!,
                                style: const TextStyle(
                                    color: Color(0xFFDA4148), fontSize: 25))
                            : const Text(""),
                        const SizedBox(height: 20),
                      ]),
                ),
              ),
            ));
  }
}
