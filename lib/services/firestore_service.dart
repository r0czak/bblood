


// class FirestoreService {
//   final authService = Provider.of<AuthService>(context);
//   final CollectionReference _usersCollectionReference =
//   FirebaseFirestore.instance.collection('users');
//
//   Future addUserInfo(UserInfoModel user) async {
//     try {
//       await _usersCollectionReference.add(user.toMap());
//       return true;
//     } catch (e) {
//       return e.toString();
//     }
//   }
// }