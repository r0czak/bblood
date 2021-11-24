import 'package:bblood/services/auth_service.dart';
import 'package:bblood/viewmodels/login_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthService());

  locator.registerLazySingleton(() => LoginModel());
}
