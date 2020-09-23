import 'package:firebase_auth/firebase_auth.dart';

class UserR {

  final String uid;

  UserR({ this.uid });
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  //create user obj based on FirebaseUser
  UserR _userFromFirebaseUser(User user) {
    return user != null ? UserR(uid: user.uid) : null;

  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //auth  change user stream
  Stream<UserR> get user {
    return _auth.authStateChanges()
      //.map((User user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }

  // sign in with email & password
    // ignore: non_constant_identifier_names
    Future SignInWhitEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      User user = result.user;
      FirebaseAuthException(message:'error');
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // register with email & password
  Future registerWhitEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}