import 'package:bblood/models/user_model.dart';
import 'package:bblood/services/firestore_service.dart';
import 'package:intl/intl.dart';

import '../enums/view_state.dart';
import '../locator.dart';
import '../services/auth_service.dart';
import 'base_model.dart';

class UserProfileDataViewModel extends BaseModel {
  final _firestoreService = locator<FirestoreService>();
  final _authService = locator<AuthService>();

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

  void updateUserBloodType(String bloodType) {
    _firestoreService.updateUserBloodType(
        _authService.currentUser.uid!, bloodType);
  }

  String dateToString(DateTime? date) {
    if (date != null) {
      return formatter.format(date).toString();
    }
    return "";
  }
}
