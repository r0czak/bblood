

class BloodLevelsModel {
  int aRh_plus;
  int aRh_minus;
  int bRh_plus;
  int bRh_minus;
  int abRh_plus;
  int abRh_minus;
  int zeroRh_plus;
  int zeroRh_minus;

  BloodLevelsModel(
      {required this.aRh_plus,
      required this.aRh_minus,
      required this.bRh_plus,
      required this.bRh_minus,
      required this.abRh_plus,
      required this.abRh_minus,
      required this.zeroRh_plus,
      required this.zeroRh_minus});

  factory BloodLevelsModel.fromMap(map) {
    return BloodLevelsModel(
        aRh_plus: map['A_Rh_plus'],
        aRh_minus: map['A_Rh_minus'],
        bRh_plus: map['B_Rh_plus'],
        bRh_minus: map['B_Rh_minus'],
        abRh_plus: map['AB_Rh_plus'],
        abRh_minus: map['AB_Rh_minus'],
        zeroRh_plus: map['0_Rh_plus'],
        zeroRh_minus: map['0_Rh_minus']);
  }

  Map<String, dynamic> toMap() {
    return {
      'A_Rh_plus': aRh_plus,
      'A_Rh_minus': aRh_minus,
      'B_Rh_plus': bRh_plus,
      'B_Rh_minus': bRh_minus,
      'AB_Rh_plus': abRh_plus,
      'AB_Rh_minus': abRh_minus,
      '0_Rh_plus': zeroRh_plus,
      '0_Rh_minus': zeroRh_minus,
    };
  }
}
