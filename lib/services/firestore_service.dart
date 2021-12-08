import 'package:bblood/models/blood_levels_model.dart';
import 'package:bblood/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference _bloodLevelsCollectionReference =
      FirebaseFirestore.instance.collection('bloodLevels');

  Future<BloodLevelsModel> getBloodLevels(String bid) async {
    try {
      var databaseData = await _bloodLevelsCollectionReference.doc(bid).get();
      return BloodLevelsModel.fromMap(databaseData.data());
    } catch (e) {
      rethrow;
    }
  }

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.doc(user.uid).set(user.toMap());
      //await _usersCollectionReference.add(user.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.doc(uid).get();
      return User.fromMap(userData.data());
    } catch (e) {
      rethrow;
    }
  }
}
