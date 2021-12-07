import 'package:cloud_firestore/cloud_firestore.dart';

class BloodType {
  int aRh_plus;
  int aRh_minus;
  int bRh_plus;
  int bRh_minus;
  int abRh_plus;
  int abRh_minus;
  int zeroRh_plus;
  int zeroRh_minus;

  BloodType(
      { required this.aRh_plus,
        required this.aRh_minus,
        required this.bRh_plus,
        required this.bRh_minus,
        required this.abRh_plus,
        required this.abRh_minus,
        required this.zeroRh_plus,
        required this.zeroRh_minus});

  factory BloodType.fromMap(map) {
    return BloodType(
        aRh_plus: map['A_Rh_plus'],
        aRh_minus: map['A_Rh_minus'],
        bRh_plus: map['B_Rh_plus'],
        bRh_minus: map['B_Rh_minus'],
        abRh_plus: map['AB_Rh_plus'],
        abRh_minus: map['AB_Rh_minus'],
        zeroRh_plus: map['0_Rh_plus'],
        zeroRh_minus: map['0_Rh_minus']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['A_Rh_plus'] =  this.aRh_plus;
    data['A_Rh_minus'] = this.aRh_minus;
    data['B_Rh_plus'] = this.bRh_plus;
    data['B_Rh_minus'] = this.bRh_minus;
    data['AB_Rh_plus'] = this.abRh_plus;
    data['AB_Rh_minus'] = this.abRh_minus;
    data['0_Rh_plus'] = this.zeroRh_plus;
    data['0_Rh_minus'] = this.zeroRh_minus;

    return data;
  }
}
