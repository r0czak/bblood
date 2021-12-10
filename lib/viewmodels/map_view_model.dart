import 'package:bblood/enums/view_state.dart';
import 'package:bblood/services/auth_service.dart';
import 'package:bblood/viewmodels/base_model.dart';

import '../locator.dart';
import '../models/locations_model.dart';
import '../models/user_location_model.dart';
import '../services/firebase_storage_service.dart';
import '../services/firestore_service.dart';

class MapViewModel extends BaseModel {
  final _authService = locator<AuthService>();
  final _firestoreService = locator<FirestoreService>();
  final _firebaseStorageService = locator<FirebaseStorageService>();

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

  Future<String> getLocationImageURL(String image) async {
    setState(ViewState.busy);
    String imageUrl = await _firebaseStorageService.getLocationImageURL(image);
    setState(ViewState.idle);

    return imageUrl;
  }

  Future<String> getUserLocationName() async {
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
