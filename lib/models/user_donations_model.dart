class UserDonationsModel {
  String? blood_type;
  String? last_donation_type;
  int? last_donation_amt;
  DateTime? last_donation_date;
  int? whole_blood_amt;
  DateTime? whole_blood_date;
  int? plasma_amt;
  DateTime? plasma_date;
  int? platelets_amt;
  DateTime? platelets_date;
  int? red_cells_amt;
  DateTime? red_cells_date;
  int? white_cells_amt;
  DateTime? white_cells_date;
  int? plasma_platelets_amt;
  DateTime? plasma_platelets_date;

  UserDonationsModel.empty() {
    this.blood_type = "";
    this.last_donation_type = "";
    this.last_donation_amt = 0;
    this.last_donation_date = null;
    this.whole_blood_amt = 0;
    this.whole_blood_date = null;
    this.plasma_amt = 0;
    this.plasma_date = null;
    this.platelets_amt = 0;
    this.platelets_date = null;
    this.red_cells_amt = 0;
    this.red_cells_date = null;
    this.white_cells_amt = 0;
    this.white_cells_date = null;
    this.plasma_platelets_amt = 0;
    this.plasma_platelets_date = null;
  }

  UserDonationsModel({
    required this.blood_type,
    required this.last_donation_type,
    required this.last_donation_amt,
    required this.last_donation_date,
    required this.whole_blood_amt,
    required this.whole_blood_date,
    required this.plasma_amt,
    required this.plasma_date,
    required this.platelets_amt,
    required this.platelets_date,
    required this.red_cells_amt,
    required this.red_cells_date,
    required this.white_cells_amt,
    required this.white_cells_date,
    required this.plasma_platelets_amt,
    required this.plasma_platelets_date,
  });

  factory UserDonationsModel.fromMap(map) {
    return UserDonationsModel(
      blood_type: map['blood_type'],
      last_donation_type: map['last_donation_type'],
      last_donation_amt: map['last_donation_amt'],
      last_donation_date: map['last_donation_date'],
      whole_blood_amt: map['whole_blood_amt'],
      whole_blood_date: map['whole_blood_date'],
      plasma_amt: map['plasma_amt'],
      plasma_date: map['plasma_date'],
      platelets_amt: map['platelets_amt'],
      platelets_date: map['platelets_date'],
      red_cells_amt: map['red_cells_amt'],
      red_cells_date: map['red_cells_date'],
      white_cells_amt: map['white_cells_amt'],
      white_cells_date: map['white_cells_date'],
      plasma_platelets_amt: map['plasma_platelets_amt'],
      plasma_platelets_date: map['plasma_platelets_date'],
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
      'whole_blood_date': whole_blood_date,
      'plasma_amt': plasma_amt,
      'plasma_date': plasma_date,
      'platelets_amt': platelets_amt,
      'platelets_date': platelets_date,
      'red_cells_amt': red_cells_amt,
      'red_cells_date': red_cells_date,
      'white_cells_amt': white_cells_amt,
      'white_cells_date': white_cells_date,
      'plasma_platelets_amt': plasma_platelets_amt,
      'plasma_platelets_date': plasma_platelets_date
    };
  }
}
