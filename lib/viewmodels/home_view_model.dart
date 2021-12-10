import 'package:bblood/enums/view_state.dart';
import 'package:bblood/models/blood_levels_model.dart';
import 'package:bblood/models/news_info_model.dart';
import 'package:bblood/services/firebase_storage_service.dart';
import 'package:bblood/viewmodels/base_model.dart';

import '../locator.dart';
import '../services/firestore_service.dart';

class HomeViewModel extends BaseModel {
  //final authService = locator<AuthService>();
  final _firestoreService = locator<FirestoreService>();
  final _firebaseStorageService = locator<FirebaseStorageService>();
  late BloodLevelsModel levels;
  late List<NewsInfoModel> news;

  Future readBloodLevels(String locationID) async {
    setState(ViewState.busy);
    levels = await _firestoreService.getBloodLevels(locationID);
    notifyListeners();
    setState(ViewState.idle);
  }

  BloodLevelsModel getBloodLevels() {
    return levels;
  }

  Future readNewsInfo() async {
    setState(ViewState.busy);
    news = await _firestoreService.getNewsInfo();
    notifyListeners();
    setState(ViewState.idle);
  }

  List<NewsInfoModel> getNews() {
    return news;
  }

  Future<String> getNewsImageURL(String image) async {
    setState(ViewState.busy);
    String imageUrl = await _firebaseStorageService.getNewsImageURL(image);
    setState(ViewState.idle);
    return imageUrl;
  }
}
