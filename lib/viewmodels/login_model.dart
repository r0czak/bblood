import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../enums/view_state.dart';
import '../locator.dart';
import '../services/auth_service.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {
  final authService = locator<AuthService>();

  late String errorMessage;

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    setState(ViewState.busy);

    try {
      var success =
          await authService.signInWithEmailAndPassword(email, password);
      setState(ViewState.idle);
      if (success == null) {
        return false;
      } else {
        return true;
      }
    } on auth.FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Invalid email.";
          break;
        case "user-disabled":
          errorMessage = "User has been disabled.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "wrong-password":
          errorMessage = "Wrong password";
          break;
        default:
          errorMessage = "Undefined error.";
      }
    }

    return false;
  }
}
