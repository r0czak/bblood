import 'package:bblood/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bblood/models/blood_type.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService {
    final CollectionReference _databaseCollectionReference =
      FirebaseFirestore.instance.collection('bloodLevels');

    Future getBloodLevels() async {
      try {
        var databaseData = await _databaseCollectionReference.doc('rsf0xWMRrSdITScqa9DZ').get();
        return BloodType.fromMap(databaseData.data());
      } catch (e) {
        // TODO: Find or create a way to repeat error handling without so much repeated code
        rethrow;
      }
    }

}