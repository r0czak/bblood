import 'package:bblood/enums/view_state.dart';
import 'package:bblood/models/blood_levels_model.dart';
import 'package:bblood/models/news_info_model.dart';
import 'package:bblood/viewmodels/base_model.dart';

import '../locator.dart';
import '../services/firestore_service.dart';

class HomeViewModel extends BaseModel {
  //final authService = locator<AuthService>();
  final _firestoreService = locator<FirestoreService>();
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
}
