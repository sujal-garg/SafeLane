import 'package:firebase_auth/firebase_auth.dart';
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
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user!.displayName);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        // child: ElevatedButton(
        //   child: const Text('Sign in with Google'),
        //   onPressed: () async {
        //     await signInWithGoogle();
        //     Navigator.pushReplacement(context,
        //         MaterialPageRoute(builder: (builder) => const HomePage()));
        //   },
        // ),
        child: SingleChildScrollView(
          child: Container(
            height: size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome to SafeLane",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                Image.asset(
                  'assets/images/road.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(
                  width: size.width * 0.8,
                  height: 60,
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
                        SizedBox(
                          width: 24,
                        ),
                        const Text(
                          "Login with Google",
                          style: TextStyle(fontSize: 18),
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
