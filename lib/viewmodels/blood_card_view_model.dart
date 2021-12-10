import 'package:bblood/enums/view_state.dart';
import 'package:bblood/services/auth_service.dart';
import 'package:bblood/viewmodels/base_model.dart';
import 'package:intl/intl.dart';

import '../locator.dart';
import '../models/locations_model.dart';
import '../models/user_donations_model.dart';
import '../models/user_location_model.dart';
import '../services/firestore_service.dart';

class BloodCardViewModel extends BaseModel {
  final _authService = locator<AuthService>();
  final _firestoreService = locator<FirestoreService>();

  DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<UserDonationsModel> getUserDonations() async {
    setState(ViewState.busy);
    UserDonationsModel donations =
        await _firestoreService.getUserDonations(_authService.currentUser.uid!);
    setState(ViewState.idle);
    return donations;
  }

  String dateToString(DateTime? date) {
    if (date != null) {
      return formatter.format(date).toString();
    }
    return "Brak daty";
  }

  Future<String> getUserLocationName() async {
    setState(ViewState.busy);
    UserLocationModel locationId = await _firestoreService
        .getUserLocationId(_authService.currentUser.uid!);
    if (locationId.location_id!.isNotEmpty) {
      LocationsModel location =
          await _firestoreService.getLocation(locationId.location_id!);
      notifyListeners();
      setState(ViewState.idle);

      return location.name;
    }

    notifyListeners();
    setState(ViewState.idle);

    return "";
  }
}
