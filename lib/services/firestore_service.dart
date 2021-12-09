import 'package:bblood/models/blood_levels_model.dart';
import 'package:bblood/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/locations_model.dart';
import '../models/user_location_model.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference _bloodLevelsCollectionReference =
      FirebaseFirestore.instance.collection('bloodLevels');

  final CollectionReference _locationsCollectionReference =
      FirebaseFirestore.instance.collection('locations');

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.doc(user.uid).set(user.toMap());
      await _usersCollectionReference
          .doc(user.uid)
          .collection('info')
          .doc('location')
          .set(UserLocationModel(location_id: "").toMap());
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

  Future<BloodLevelsModel> getBloodLevels(String bid) async {
    try {
      var databaseData = await _bloodLevelsCollectionReference.doc(bid).get();
      return BloodLevelsModel.fromMap(databaseData.data());
    } catch (e) {
      rethrow;
    }
  }

  Future<List<LocationsModel>> getLocations() async {
    try {
      QuerySnapshot result = await _locationsCollectionReference.get();
      List<DocumentSnapshot> documents = result.docs;

      List<LocationsModel> locations = <LocationsModel>[];
      for (var data in documents) {
        locations.add(LocationsModel.fromMap(data));
      }

      return locations;
    } catch (e) {
      rethrow;
    }
  }
}
