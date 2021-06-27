import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instargram/tab_page.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Instargram Clon',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(50),
            ),
            SignInButton(
                Buttons.Google,
                onPressed: () {
                  _handleSignIn()
                      .then((user) =>
                      Navigator.push(
                          context,
                        MaterialPageRoute(
                              builder: (context) => TabPage(user!)))
                  );
                }
            )
          ],
        ),
      ),
    );
  }

  Future<User?> _handleSignIn() async{
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    UserCredential userCredential = await _auth.signInWithCredential(credential);
    return userCredential.user;
  }
}
