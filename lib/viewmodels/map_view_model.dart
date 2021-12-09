import 'package:bblood/enums/view_state.dart';
import 'package:bblood/viewmodels/base_model.dart';

import '../locator.dart';
import '../models/locations_model.dart';
import '../services/firestore_service.dart';

class MapViewModel extends BaseModel {
  final _firestoreService = locator<FirestoreService>();

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

  bool isEmpty() {
    return locations.isEmpty;
  }
}
