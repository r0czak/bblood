import 'package:bblood/models/blood_levels_model.dart';
import 'package:bblood/models/news_info_model.dart';
import 'package:bblood/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/locations_model.dart';
import '../models/user_donations_model.dart';
import '../models/user_location_model.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference _bloodLevelsCollectionReference =
      FirebaseFirestore.instance.collection('bloodLevels');

  final CollectionReference _locationsCollectionReference =
      FirebaseFirestore.instance.collection('locations');

  final CollectionReference _newsInfoCollectionReference =
      FirebaseFirestore.instance.collection('news');

  Future createUser(User user) async {
    try {
      UserDonationsModel donations = UserDonationsModel.empty();
      await _usersCollectionReference.doc(user.uid).set(user.toMap());
      await _usersCollectionReference
          .doc(user.uid)
          .collection('info')
          .doc('location')
          .set(UserLocationModel(location_id: "").toMap());
      await _usersCollectionReference
          .doc(user.uid)
          .collection('info')
          .doc('donations')
          .set(donations.toMap());
      //await _usersCollectionReference.add(user.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUser(String uid) async {
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

  Future<LocationsModel> getLocation(String locationIn) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection("locations")
          .doc(locationIn)
          .get();

      return LocationsModel.fromMap(result.data());
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getLocationIdbyName(String locationName) async {
    try {
      QuerySnapshot result = await _locationsCollectionReference.get();
      List<DocumentSnapshot> documents = result.docs;

      for (var data in documents) {
        if (LocationsModel.fromMap(data).name == locationName) {
          return data.id;
        }
      }
      return documents.first.id;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserLocationModel> getUserLocationId(String uid) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("info")
          .doc("location")
          .get();

      return UserLocationModel.fromMap(result.data());
    } catch (e) {
      rethrow;
    }
  }

  void updateUserLocation(String uid, String locationId) {
    try {
      DocumentReference result = FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("info")
          .doc("location");

      UserLocationModel location = UserLocationModel(location_id: locationId);
      result.set(location.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<UserDonationsModel> getUserDonations(String uid) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("info")
          .doc("donations")
          .get();

      return UserDonationsModel.fromMap(result.data());
    } catch (e) {
      rethrow;
    }
  }

  void updateUserBloodType(String uid, String bloodType) {
    DocumentReference result = FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("info")
        .doc("donations");

    result.update({"blood_type": bloodType});
  }

  Future<List<NewsInfoModel>> getNewsInfo() async {
    try {
      QuerySnapshot result = await _newsInfoCollectionReference.get();
      List<DocumentSnapshot> documents = result.docs;

      List<NewsInfoModel> newsInfo = <NewsInfoModel>[];
      documents.forEach((data) {
        newsInfo.add(NewsInfoModel.fromMap(data));
      });
      return newsInfo;
    } catch (e) {
      rethrow;
    }
  }
}
