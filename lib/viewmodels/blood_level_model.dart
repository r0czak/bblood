import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../enums/view_state.dart';
import '../locator.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import '../services/navigation_service.dart';
import '../models/blood_type.dart';
import 'base_model.dart';

class BloodLevelModel extends BaseModel {
  //final authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _firestoreService = locator<FirestoreService>();
  late BloodType type;

  Future<BloodType> modelFunction(String locationID) async {
    return _firestoreService.getBloodLevels(locationID);
  }



}