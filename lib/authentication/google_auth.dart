// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:safelane/tabs/home.dart';

class GoogleAuth extends StatefulWidget {
  const GoogleAuth({super.key});

  @override
  State<GoogleAuth> createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {
  Future<dynamic> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? account = await googleSignIn.signIn();

    if (account != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await account.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      await saveUser(account);
      if (kDebugMode) {
        print(userCredential.user!.displayName);
      }
    }
  }

  Future<dynamic> saveUser(GoogleSignInAccount account) async {
    FirebaseFirestore.instance.collection("users").doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profile pic": account.photoUrl
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/splash.png',
                  width: 200,
                  height: 200,
                ),
                Text("Welcome to SafeLane.",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 24),
                    textAlign: TextAlign.left),
                SizedBox(
                  width: size.width * 0.8,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      await signInWithGoogle();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/google-icon.svg"),
                        const SizedBox(
                          width: 24,
                        ),
                        const Text(
                          "Login with Google",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
