import 'package:bblood/models/user_model.dart';
import 'package:bblood/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../enums/view_state.dart';
import '../locator.dart';
import '../services/auth_service.dart';
import '../services/navigation_service.dart';
import 'base_model.dart';

class UserProfileModel extends BaseModel {
  final _firestoreService = locator<FirestoreService>();
  final authService = locator<AuthService>();

  Future getUser() async {
    setState(ViewState.busy);
    User user = await _firestoreService.getUser(authService.currentUser.uid!);
    notifyListeners();
    setState(ViewState.idle);
    return user;
  }

}
