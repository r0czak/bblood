import 'package:flutter/material.dart';
import 'package:bblood/views/user_profile_page.dart';
import 'package:bblood/widgets/blood_card_widget.dart';

class BloodCardScreen extends StatefulWidget {
  const BloodCardScreen({Key? key}) : super(key: key);

  @override
  _BloodCardScreenState createState() => _BloodCardScreenState();
}

class _BloodCardScreenState extends State<BloodCardScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          children: [
                            Text("Twoja ostatnia donacja", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Czwartek, 11.11.2021r.", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Text("Krew pełna", style: TextStyle(fontSize: 18)),
                        SizedBox(height: 5,),
                        Text("500ml", style: TextStyle(fontSize: 24)),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFDCDCDC),
                          ),
                          child: Text("Ciśnienie: 128/71          Puls: 7/29"),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on),
                            Text("RCKiK w Lodzi"),
                          ],
                        ),
                      ],
                    ),
                ),
                Divider(color: Colors.black),
                Expanded(
                  child: CardWidget("1500"),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
