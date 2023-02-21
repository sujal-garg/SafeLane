import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safelane/authentication/components/text_field.dart';

class CreateNewPasssword extends StatelessWidget {
  const CreateNewPasssword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Text(
              "Create New Password",
              style: GoogleFonts.poppins(
                  color: const Color(0xff005FFF),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Text(
                "Your new password must be different \nfrom previous used passwords",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Color(0xff7A7A7A)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextFieldContainer(
              child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.lock),
                    hintText: "Enter your new password",
                    border: InputBorder.none,
                  )),
            ),
            const TextFieldContainer(
              child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.visibility_off),
                    hintText: "Confirm new password",
                    border: InputBorder.none,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: size.width * 0.8,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text("Reset Password"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
