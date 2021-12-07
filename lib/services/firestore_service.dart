import 'package:bblood/models/user_model.dart';
import 'package:bblood/models/blood_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //final authService = locator<AuthService>();
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference _bloodLevelsCollectionReference =
    FirebaseFirestore.instance.collection('bloodLevels');

  Future<BloodType> getBloodLevels(String bid) async {
    try {
      var databaseData = await _bloodLevelsCollectionReference.doc(bid).get();
      return BloodType.fromMap(databaseData.data());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      rethrow;
    }
  }

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.doc(user.uid).set(user.toMap());
      //await _usersCollectionReference.add(user.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      rethrow;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.doc(uid).get();
      return User.fromMap(userData.data());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      rethrow;
    }
  }


}
