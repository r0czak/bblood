import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardWidget extends StatelessWidget {
  DateTime? lastDonation;
  String? amount;
  CardWidget(this.amount, this.lastDonation);

  String countNextDonation(){
    final nextDonation = new DateTime(lastDonation!.year, lastDonation!.month, lastDonation!.day + 55);
    String date = DateFormat("dd.MM.yyyy").format(nextDonation);
    return date;
  }

  DateTime tempDateTime(){
    return DateTime(lastDonation!.year, lastDonation!.month, lastDonation!.day + 55);
  }
/*
  String countOfDays(){
    final date = DateTime.now();
    final difference = date.difference(tempDateTime());`
    final result = DateFormat.jm();
    return result.format(difference);
  }
*/
  Widget buildCard(String type, String amount, String nextDonation, String date, int hexColor){
    return Card(
      color: Color(hexColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 6,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(type,
              style: const TextStyle(color: Colors.white, fontSize: 20)),
          const SizedBox(height: 25),
          Text(amount + " ml",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 25),
          Text("Następna donacja za " + nextDonation + " dni",
              style: const TextStyle(color: Colors.white, fontSize: 12)),
          const SizedBox(height: 5),
          Text(countNextDonation() + " r.",
              style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        children: [
          buildCard('Krew pełna', '1500', '40', '27.12.2021', 0xffda4148),
          buildCard('Osocze', '400', '15', '11.12.2021', 0xfff0c631),
          buildCard('Płytki krwi', '50', '34', '13.01.2022', 0xffff8f61),
          buildCard('Krwinki czerwone', '50', '34', '13.01.2022', 0xff2ac3ff),
          buildCard('Krwinki białe', '0', '34', '13.01.2022', 0xff5a65ff),
          buildCard('Osocze i płytki', '100', '34', '13.01.2022', 0xff96da45),
        ],
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
      ),
    );
  }
}