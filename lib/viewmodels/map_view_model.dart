import 'package:bblood/enums/view_state.dart';
import 'package:bblood/viewmodels/base_model.dart';

import '../locator.dart';
import '../models/locations_model.dart';
import '../services/firebase_storage_service.dart';
import '../services/firestore_service.dart';

class MapViewModel extends BaseModel {
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
}
