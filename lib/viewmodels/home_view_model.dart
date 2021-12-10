import 'package:bblood/enums/view_state.dart';
import 'package:bblood/models/blood_levels_model.dart';
import 'package:bblood/services/auth_service.dart';
import 'package:bblood/viewmodels/base_model.dart';

import '../locator.dart';
import '../models/user_location_model.dart';
import '../services/firestore_service.dart';

class HomeViewModel extends BaseModel {
  final _authService = locator<AuthService>();
  final _firestoreService = locator<FirestoreService>();
  late BloodLevelsModel levels;

  Future readBloodLevels(String locationID) async {
    setState(ViewState.busy);
    levels = await _firestoreService.getBloodLevels(locationID);
    notifyListeners();
    setState(ViewState.idle);
  }

  BloodLevelsModel getBloodLevels() {
    return levels;
  }

  Future getUserLocationId() async {
    setState(ViewState.busy);
    UserLocationModel location =
        await _firestoreService.getUserLocationId(_authService.currentUser.uid!);
    setState(ViewState.busy);
    return location.location_id;
  }
}
