import 'package:bblood/models/locations_model.dart';
import 'package:bblood/models/user_location_model.dart';
import 'package:bblood/models/user_model.dart';
import 'package:bblood/services/firestore_service.dart';

import '../enums/view_state.dart';
import '../locator.dart';
import '../services/auth_service.dart';
import '../services/navigation_service.dart';
import 'base_model.dart';

class UserProfileModel extends BaseModel {
  final _firestoreService = locator<FirestoreService>();
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  late List<LocationsModel> locations;

  Future readLocations() async {
    setState(ViewState.busy);
    locations = await _firestoreService.getLocations();
    notifyListeners();
    setState(ViewState.idle);
  }

  List<LocationsModel> getLocations() {
    return locations;
  }

  void navigateToSignIn() {
    _navigationService.navigateTo('/');
  }

  Future getUser() async {
    setState(ViewState.busy);
    User user = await _firestoreService.getUser(_authService.currentUser.uid!);
    notifyListeners();
    setState(ViewState.idle);
    return user;
  }

  Future<String> getUserLocation() async {
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

  void updateUserLocation(String locationName) async {
    String locationId =
        await _firestoreService.getLocationIdbyName(locationName);

    _firestoreService.updateUserLocation(
        _authService.currentUser.uid!, locationId);
  }

  Future<bool> isLocationSet() async {
    bool result = false;
    UserLocationModel locationId = await _firestoreService
        .getUserLocationId(_authService.currentUser.uid!);
    if (locationId.location_id != null) {
      result = true;
    }
    return result;
  }
}
