import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../enums/view_state.dart';
import '../locator.dart';
import '../services/auth_service.dart';
import '../services/navigation_service.dart';
import 'base_model.dart';

class RegisterModel extends BaseModel {
  final authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  late String errorMessage;

  Future<bool> createUserWithEmailAndPassword(
      String firstName,
      String lastName,
      Timestamp birthday,
      String peselNumber,
      String email,
      String password) async {
    setState(ViewState.busy);

    try {
      var success = await authService.signUpWithEmailAndPassword(
          firstName: firstName,
          lastName: lastName,
          birthday: birthday,
          peselNumber: peselNumber,
          email: email,
          password: password);
      setState(ViewState.idle);
      if (success == null) {
        return false;
      } else {
        _navigationService.navigateTo('/home');
        return true;
      }
    } on auth.FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Niepoprawny e-mail.";
          break;
        case "email-already-in-use":
          errorMessage = "Adres e-mail już jest w użyciu.";
          break;
        case "weak-password":
          errorMessage = "Ustaw silniejsze hasło.";
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
}
