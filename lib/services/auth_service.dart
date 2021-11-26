import 'package:bblood/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../locator.dart';
import 'firestore_service.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  late User _currentUser;

  User get currentUser => _currentUser;

  Future signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      rethrow;
    }
  }

  Future signUpWithEmail({
    required String firstName,
    required String lastName,
    required DateTime birthday,
    required String peselNumber,
    required String email,
    required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // create a new user profile on firestore
      _currentUser = User(
          uid: authResult.user!.uid,
          firstName: firstName,
          lastName: lastName,
          birthday: birthday,
          peselNumber: peselNumber,
          email: email,
          password: password);

      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    await _populateCurrentUser(user);
    return user != null;
  }

  // User? _userFromFirebase(auth.User? user) {
  //   if (user == null) return null;
  //   return User(user.uid, user.email);
  // }
  //
  // Stream<User?>? get user {
  //   return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  // }
  //
  // Future<User?> signInWithEmailAndPassword(
  //   String email,
  //   String password,
  // ) async {
  //   try {
  //     final credential = await _firebaseAuth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //
  //     return _userFromFirebase(credential.user);
  //   } on auth.FirebaseAuthException {
  //     rethrow;
  //   }
  // }
  //
  // Future<User?> createUserWithEmailAndPassword(
  //   String email,
  //   String password,
  // ) async {
  //   try {
  //     final credential = await _firebaseAuth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //
  //     return _userFromFirebase(credential.user);
  //   } on auth.FirebaseAuthException {
  //     rethrow;
  //   }
  // }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future _populateCurrentUser(auth.User? user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
}
