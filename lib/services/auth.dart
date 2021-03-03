import 'package:mtlu_brew_crew/models/authuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mtlu_brew_crew/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  AuthUser _userFromFirebase(User user) {
    return user != null ? AuthUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<AuthUser> get user {
    return _auth.authStateChanges().map((User user) => _userFromFirebase(user));
  }

  // sign in anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in email & password
  Future<dynamic> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      print('login success');
      print(result);
      return _userFromFirebase(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register
  Future<dynamic> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());

      await DatabaseService(uid: result.user.uid).updateUserData('0', 'New member', 100);

      return _userFromFirebase(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  // sign out
  Future<dynamic> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
