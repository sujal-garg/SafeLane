import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              elevation: 0,
              leading: const BackButton(
                color: Colors.black,
              ),
              centerTitle: true,
              title: const Text(
                "About",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              backgroundColor: Colors.white,
            ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
            top: Get.height / 60, left: Get.width / 30, right: Get.width / 30),
        child: Column(
          children: [
            SizedBox(height: Get.height / 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    ' SafeLane is designed to tackle the neglected issue of potholes, open manholes, and other road hazards that can lead to accidents. \n\nBy using SafeLane to report hazards on the road - such as potholes and open manholes - you are helping to create safer and more sustainable cities and communities.\n\nThis app also directly informs the government about the coordinates of the hazards via a deeplink, ensuring that action can be taken to fix the problem.\n\nSafeLane makes it easy for everyone to play a part in creating a safer, healthier, and more sustainable world.\n\nStay in your lane and arrive safe with SafeLane.',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        wordSpacing: 1.5,
                        height: 1.5),
                  ),
                  SizedBox(height: Get.height / 30),
                  const Text('Developer',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: Get.height / 50),
                  const Text(
                    'This app is developed by Team Forage',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                      wordSpacing: 1.5,
                      height: 1.5 ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
