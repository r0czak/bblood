import 'package:bblood/models/blood_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BloodDropsStateWidget extends StatelessWidget{
  BloodType type;
  BloodDropsStateWidget(this.type);

  List<String> bloodImages = <String>['images/alarmB.png', 'images/very_lowB.png', 'images/lowB.png', 'images/mediumB.png', 'images/highB.png'];
  List<String> bloodAmount = <String>['stan alarmowy', 'stan bardzo niski', 'stan niski', 'stan średni', 'stan wysoki'];

  // int aRhplusAmount = 10;
  // int aRhminusAmount = 12;
  // int bRhplusAmount = 10;
  // int bRhminusAmount = 90;
  // int abRhplusAmount = 77;
  // int abRhminusAmount = 10;
  // int zeroRhplusAmount = 10;
  // int zeroRhminusAmount = 10;

  List<String> loadBloodState(String bloodType){
    List<String> list = <String>[];
    int check = 0;
    if (bloodType == 'A Rh+') {
      check = checkBloodAmount(type.aRh_plus);
      list.add(bloodImages[check]);
      list.add(bloodAmount[check]);
    } else if (bloodType == 'A Rh-') {
      check = checkBloodAmount(type.aRh_plus);
      list.add(bloodImages[check]);
      list.add(bloodAmount[check]);
    } else if (bloodType == 'B Rh+') {
      check = checkBloodAmount(type.aRh_plus);
      list.add(bloodImages[check]);
      list.add(bloodAmount[check]);
    } else if (bloodType == 'B Rh-') {
      check = checkBloodAmount(type.aRh_plus);
      list.add(bloodImages[check]);
      list.add(bloodAmount[check]);
    } else if (bloodType == 'AB Rh+') {
      check = checkBloodAmount(type.aRh_plus);
      list.add(bloodImages[check]);
      list.add(bloodAmount[check]);
    } else if (bloodType == 'AB Rh-') {
      check = checkBloodAmount(type.aRh_plus);
      list.add(bloodImages[check]);
      list.add(bloodAmount[check]);
    } else if (bloodType == '0 Rh+') {
      check = checkBloodAmount(type.aRh_plus);
      list.add(bloodImages[check]);
      list.add(bloodAmount[check]);
    } else if (bloodType == '0 Rh-') {
      check = checkBloodAmount(type.aRh_plus);
      list.add(bloodImages[check]);
      list.add(bloodAmount[check]);
    }
    return list;
  }

  int checkBloodAmount(int amount){
    if (amount > 0 && amount <= 10){
      return 0;
    } else if (amount > 10 && amount <= 30){
      return 1;
    } else if (amount > 30 && amount <= 55){
      return 2;
    } else if (amount > 55 && amount <= 80){
      return 3;
    } else {
      return 4;
    }
  }


  Widget buildCard(String bloodType){
    return SizedBox(
      height: 500,
      width: 50,
        child: Column(
          children: [
            Image.asset(
              loadBloodState(bloodType)[0],
              height: 80,
            ),
            Text(loadBloodState(bloodType)[1],
                style: TextStyle(color: Color(0xFF404040), fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(bloodType,
                style: TextStyle(color: Color(0xFF404040), fontSize: 17, fontWeight: FontWeight.bold)),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
        children: [
          buildCard('A Rh+'),
          buildCard('A Rh-'),
          buildCard('B Rh+'),
          buildCard('B Rh-'),
          buildCard('AB Rh+'),
          buildCard('AB Rh-'),
          buildCard('0 Rh+'),
          buildCard('0 Rh-'),
        ],
        crossAxisCount: 4,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: (200 / 250),
      ),
    );
  }
}