import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safelane/authentication/login.dart';
import 'package:safelane/authentication/otp_verify.dart';

import 'components/text_field.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Back",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
            onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> loginScreen()),);
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                "Forgot Password ?",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: const Text(
                  "Enter the email associated with your \naccount and we’ll send an OTP to \nreset your password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff7A7A7A)
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextFieldContainer(
                child: TextField(
                    decoration: InputDecoration(
                  suffixIcon: Icon(Icons.mail),
                  hintText: "Enter your email",
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
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>const otpForm()),);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text("Send Email"),
                ),
              ),
              
            ],
          ),
        ));
  }
}
