import 'package:cloud_firestore/cloud_firestore.dart';

class UserDonationsModel {
  String? blood_type;
  String? last_donation_type;
  int? last_donation_amt;
  Timestamp? last_donation_date;
  int? whole_blood_amt;
  int? plasma_amt;
  int? platelets_amt;
  int? red_cells_1_amt;
  int? red_cells_2_amt;
  int? white_cells_amt;
  int? plasma_platelets_amt;

  UserDonationsModel.empty() {
    this.blood_type = "";
    this.last_donation_type = "";
    this.last_donation_amt = 0;
    this.last_donation_date = null;
    this.whole_blood_amt = 0;
    this.plasma_amt = 0;
    this.platelets_amt = 0;
    this.red_cells_1_amt = 0;
    this.red_cells_2_amt = 0;
    this.white_cells_amt = 0;
    this.plasma_platelets_amt = 0;
  }

  UserDonationsModel({
    required this.blood_type,
    required this.last_donation_type,
    required this.last_donation_amt,
    required this.last_donation_date,
    required this.whole_blood_amt,
    required this.plasma_amt,
    required this.platelets_amt,
    required this.red_cells_1_amt,
    required this.red_cells_2_amt,
    required this.white_cells_amt,
    required this.plasma_platelets_amt,
  });

  factory UserDonationsModel.fromMap(map) {
    return UserDonationsModel(
      blood_type: map['blood_type'],
      last_donation_type: map['last_donation_type'],
      last_donation_amt: map['last_donation_amt'],
      last_donation_date: map['last_donation_date'],
      whole_blood_amt: map['whole_blood_amt'],
      plasma_amt: map['plasma_amt'],
      platelets_amt: map['platelets_amt'],
      red_cells_1_amt: map['red_cells_1_amt'],
      red_cells_2_amt: map['red_cells_2_amt'],
      white_cells_amt: map['white_cells_amt'],
      plasma_platelets_amt: map['plasma_platelets_amt'],
    );
  }

  // send data to the server
  Map<String, dynamic> toMap() {
    return {
      'blood_type': blood_type,
      'last_donation_type': last_donation_type,
      'last_donation_amt': last_donation_amt,
      'last_donation_date': last_donation_date,
      'whole_blood_amt': whole_blood_amt,
      'plasma_amt': plasma_amt,
      'platelets_amt': platelets_amt,
      'red_cells_1_amt': red_cells_1_amt,
      'red_cells_2_amt': red_cells_2_amt,
      'white_cells_amt': white_cells_amt,
      'plasma_platelets_amt': plasma_platelets_amt,
    };
  }
}
