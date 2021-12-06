import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../enums/view_state.dart';
import '../locator.dart';
import '../services/auth_service.dart';
import '../services/navigation_service.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {
  final authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  late String errorMessage;

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    setState(ViewState.busy);

    try {
      var success = await authService.signInWithEmailAndPassword(
          email: email, password: password);
      setState(ViewState.idle);
      if (success == null) {
        return false;
      } else {
        return true;
      }
    } on auth.FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Podany e-mail nie istnieje.";
          break;
        case "user-disabled":
          errorMessage = "Użytkownik został zablokowany.";
          break;
        case "user-not-found":
          errorMessage = "Podany użytkownik nie istnieje.";
          break;
        case "wrong-password":
          errorMessage = "Podane hasło niepoprawne";
          break;
        default:
          errorMessage = "Błąd";
      }
    }

    return false;
  }

  void navigateToSignUp() {
    _navigationService.navigateTo('/register');
  }

  void navigateToHome() {
    _navigationService.navigateTo('/home');
  }
}
