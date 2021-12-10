import 'package:bblood/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../models/user_donations_model.dart';
import '../viewmodels/blood_card_view_model.dart';
import '../widgets/blood_card_widget.dart';

class BloodCardScreen extends StatefulWidget {
  const BloodCardScreen({Key? key}) : super(key: key);

  @override
  _BloodCardScreenState createState() => _BloodCardScreenState();
}

class _BloodCardScreenState extends State<BloodCardScreen> {
  UserDonationsModel? donations;
  String? locationName;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BloodCardViewModel>.reactive(
        viewModelBuilder: () => BloodCardViewModel(),
        onModelReady: (model) async {
          donations = await model.getUserDonations();
          locationName = await model.getUserLocationName();
        },
        builder: (context, model, child) => Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: const Color(0xFFEDEDED),
              body: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Text("Twoja ostatnia donacja",
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                    model.state == ViewState.busy
                                        ? ""
                                        : model.dateToString(donations!
                                            .last_donation_date!
                                            .toDate()),
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                model.state == ViewState.busy
                                    ? ""
                                    : donations!.last_donation_type!,
                                style: TextStyle(fontSize: 20)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                model.state == ViewState.busy
                                    ? ""
                                    : donations!.last_donation_amt!.toString() +
                                        "ml",
                                style: TextStyle(fontSize: 40)),
                            SizedBox(
                              height: 10,
                            ),
                            // Container(
                            //   padding: EdgeInsets.all(10),
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10),
                            //     color: Color(0xFFDCDCDC),
                            //   ),
                            //   child:
                            //       Text("Ciśnienie: 128/71          Puls: 7/29"),
                            // ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on),
                                Text(
                                    model.state == ViewState.busy
                                        ? ""
                                        : locationName!,
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.black),
                      Expanded(
                        child: model.state == ViewState.busy
                            ? Container()
                            : CardWidget(donations!),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
