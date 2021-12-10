import 'package:bblood/services/auth_service.dart';
import 'package:bblood/services/firebase_storage_service.dart';
import 'package:bblood/services/firestore_service.dart';
import 'package:bblood/services/navigation_service.dart';
import 'package:bblood/viewmodels/home_view_model.dart';
import 'package:bblood/viewmodels/login_model.dart';
import 'package:bblood/viewmodels/map_view_model.dart';
import 'package:get_it/get_it.dart';

import 'viewmodels/register_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => FirebaseStorageService());

  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => RegisterModel());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => MapViewModel());
}
