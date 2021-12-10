import 'package:bblood/enums/view_state.dart';
import 'package:bblood/models/user_model.dart';
import 'package:bblood/services/auth_service.dart';
import 'package:bblood/viewmodels/base_model.dart';
import 'package:intl/intl.dart';

import '../locator.dart';
import '../services/firestore_service.dart';

class HonoraryCardViewModel extends BaseModel {
  final _authService = locator<AuthService>();
  final _firestoreService = locator<FirestoreService>();

  DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<User> getUser() async {
    setState(ViewState.busy);
    User user = await _firestoreService.getUser(_authService.currentUser.uid!);
    notifyListeners();
    setState(ViewState.idle);

    return user;
  }


  Future<String> getUserBloodType() async {
    setState(ViewState.busy);
    String bloodType = (await _firestoreService
        .getUserDonations(_authService.currentUser.uid!))
        .blood_type!;
    notifyListeners();
    setState(ViewState.idle);

    return bloodType;
  }

  String dateToString(DateTime? date) {
    if (date != null) {
      return formatter.format(date).toString();
    }
    return "";
  }
}
