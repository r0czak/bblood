
import '../locator.dart';
import '../services/auth_service.dart';
import '../services/navigation_service.dart';
import 'base_model.dart';

class UserProfileModel extends BaseModel {
  final _firestoreService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  late String errorMessage;



  void navigateToSignIn() {
    _navigationService.navigateTo('/');
  }
}
