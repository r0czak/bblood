import 'package:bblood/models/blood_levels_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference _databaseCollectionReference =
      FirebaseFirestore.instance.collection('bloodLevels');

  Future getBloodLevels() async {
    try {
      var databaseData =
          await _databaseCollectionReference.doc('rsf0xWMRrSdITScqa9DZ').get();
      return BloodLevelsModel.fromMap(databaseData.data());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      rethrow;
    }
  }
}
