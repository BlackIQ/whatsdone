import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:whatsdone/app/models/user.dart';

class AuthService {
  // Init firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _google = GoogleSignIn();

  // Convert firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    if (user != null) {
      return User(
        uid: user.uid,
        profile: user.photoUrl,
        name: user.displayName,
        email: user.email,
        phone: user.phoneNumber,
      );
    } else {
      return null;
    }
  }

  // User
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // Signin with Google
  Future googleLogin() async {
    try {
      GoogleSignInAccount googleAccount = await _google.signIn();
      if (googleAccount != null) {
        GoogleSignInAuthentication googleAuth =
            await googleAccount.authentication;

        if (googleAuth.idToken != null && googleAuth.accessToken != null) {
          AuthResult result = await _auth.signInWithCredential(
            GoogleAuthProvider.getCredential(
              idToken: googleAuth.idToken,
              accessToken: googleAuth.accessToken,
            ),
          );
          return _userFromFirebaseUser(result.user);
        }
      }
    } catch (e) {
      return [
        null,
        e.toString(),
      ];
    }
  }

  // Signout
  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (e) {
      return [
        null,
        e.toString(),
      ];
    }
  }
}
