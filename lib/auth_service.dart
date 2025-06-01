import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
<<<<<<< HEAD

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<void> reloadUser() async {
    final user = _auth.currentUser;
    if (user != null) await user.reload();
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
=======
import 'user_model.dart';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage(); // ✅ Secure storage instance
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ✅ Getter for current Firebase user
  User? get currentUser => _auth.currentUser;

  Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

<<<<<<< HEAD
      final credential = GoogleAuthProvider.credential(
=======
      final AuthCredential credential = GoogleAuthProvider.credential(
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

<<<<<<< HEAD
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      print("Google sign-in error: $e");
=======
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        // ✅ Store email securely
        await _secureStorage.write(key: 'email', value: firebaseUser.email);
        return UserModel.fromFirebaseUser(firebaseUser);
      } else {
        return null;
      }
    } catch (e) {
      log("Google Sign-In Error: $e");
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
      return null;
    }
  }

  Future<void> signOut() async {
<<<<<<< HEAD
    await GoogleSignIn().signOut();
    await _auth.signOut();
  }
}

=======
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      await _secureStorage.deleteAll(); // ✅ Clear all secure storage
    } catch (e) {
      log("Sign-Out Error: $e");
    }
  }
}



>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
