import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/user_donations_model.dart';

class CardWidget extends StatelessWidget {
  UserDonationsModel donations;
  DateFormat formatter = DateFormat('yyyy-MM-dd');

  CardWidget(this.donations);

  DateTime countNextDonation(
      String lastType, DateTime lastDonation, String nextType) {
    DateTime nextDonation = DateTime.now();

    switch (lastType) {
      case "Krew pełna":
        switch (nextType) {
          case "Osocze":
          case "Krwinki białe":
            nextDonation = DateTime(
                lastDonation.year, lastDonation.month, lastDonation.day + 28);
            break;
          case "Krwinki czerwone 2j.":
            nextDonation = DateTime(
                lastDonation.year, lastDonation.month, lastDonation.day + 84);
            break;
          default:
            nextDonation = DateTime(
                lastDonation.year, lastDonation.month, lastDonation.day + 56);
            break;
        }
        break;
      case "Osocze":
        switch (nextType) {
          case "Krew pełna":
          case "Osocze":
            nextDonation = DateTime(
                lastDonation.year, lastDonation.month, lastDonation.day + 14);
            break;
          default:
            nextDonation = DateTime(
                lastDonation.year, lastDonation.month, lastDonation.day + 28);
            break;
        }
        break;
      case "Płytki krwi":
        nextDonation = DateTime(
            lastDonation.year, lastDonation.month, lastDonation.day + 28);
        break;
      case "Krwinki czerwone 1j.":
        switch (nextType) {
          case "Krew pełna":
          case "Krwinki czerwone 1j.":
            nextDonation = DateTime(
                lastDonation.year, lastDonation.month, lastDonation.day + 56);
            break;
          case "Krwinki czerwone 2j.":
            nextDonation = DateTime(
                lastDonation.year, lastDonation.month, lastDonation.day + 84);
            break;
          default:
            nextDonation = DateTime(
                lastDonation.year, lastDonation.month, lastDonation.day + 28);
            break;
        }
        break;
      case "Krwinki czerwone 2j.":
        switch (nextType) {
          case "Krwinki czerwone 1j.":
          case "Krwinki czerwone 2j.":
            nextDonation = DateTime(
                lastDonation.year, lastDonation.month, lastDonation.day + 168);
            break;
          default:
            nextDonation = DateTime(
                lastDonation.year, lastDonation.month, lastDonation.day + 84);
            break;
        }
        break;
      case "Krwinki białe":
        nextDonation = DateTime(
            lastDonation.year, lastDonation.month, lastDonation.day + 28);
        break;
      case "Płytki krwi i osocze":
        switch (nextType) {
          case "Krwinki czerwone 2j.":
            nextDonation = DateTime(
                lastDonation.year, lastDonation.month, lastDonation.day + 84);
            break;
          default:
            nextDonation = DateTime(
                lastDonation.year, lastDonation.month, lastDonation.day + 28);
            break;
        }
        break;
    }

    return nextDonation;
  }

  String countOfDays(DateTime date) {
    final dateNow = DateTime.now();
    final difference = date.difference(dateNow);

    return difference.toString();
  }

  Widget buildCard(String type, int amount, String nextDonation, DateTime date,
      int hexColor) {
    return Card(
      color: Color(hexColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 6,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(type, style: const TextStyle(color: Colors.white, fontSize: 18)),
          const SizedBox(height: 25),
          Text(amount.toString() + " ml",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 25),
          Text("Następna donacja za " + nextDonation + " dni",
              style: const TextStyle(color: Colors.white, fontSize: 12)),
          const SizedBox(height: 5),
          Text(formatter.format(date).toString(),
              style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    if (donations.last_donation_date == null) {
      return Container();
    }
    return Container(
      child: GridView(
        children: [
          buildCard(
              'Krew pełna',
              donations.whole_blood_amt!,
              '40',
              countNextDonation(donations.last_donation_type!,
                  donations.last_donation_date!.toDate(), "Krew pełna"),
              0xffda4148),
          buildCard(
              'Osocze',
              donations.plasma_amt!,
              '15',
              countNextDonation(donations.last_donation_type!,
                  donations.last_donation_date!.toDate(), "Osocze"),
              0xfff0c631),
          buildCard(
              'Płytki krwi',
              donations.platelets_amt!,
              '34',
              countNextDonation(donations.last_donation_type!,
                  donations.last_donation_date!.toDate(), "Płytki Krwi"),
              0xffff8f61),
          buildCard(
              'Krwinki czerwone 1j.',
              donations.red_cells_1_amt!,
              '34',
              countNextDonation(
                  donations.last_donation_type!,
                  donations.last_donation_date!.toDate(),
                  "Krwinki czerwone 1j."),
              0xff2ac3ff),
          buildCard(
              'Krwinki czerwone 2j.',
              donations.red_cells_2_amt!,
              '34',
              countNextDonation(
                  donations.last_donation_type!,
                  donations.last_donation_date!.toDate(),
                  "Krwinki czerwone 2j."),
              0xff2ac3ff),
          buildCard(
              'Krwinki białe',
              donations.white_cells_amt!,
              '34',
              countNextDonation(donations.last_donation_type!,
                  donations.last_donation_date!.toDate(), "Krwinki białe"),
              0xff5a65ff),
          buildCard(
              'Płytki krwi i osocze',
              donations.plasma_platelets_amt!,
              '34',
              countNextDonation(
                  donations.last_donation_type!,
                  donations.last_donation_date!.toDate(),
                  "Płytki krwi i osocze"),
              0xff96da45),
        ],
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
      ),
    );
  }
}
