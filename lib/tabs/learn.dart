import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Learn extends StatelessWidget {
  const Learn ({super.key});

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
                "Learn",
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
                children: const [
                  Text(
                    ' Road safety is an essential aspect of ensuring the well-being of individuals and society as a whole. Millions of people use roads every day, and it is crucial to take appropriate measures to prevent accidents and injuries.\n\nDrivers, pedestrians, and cyclists all have a responsibility to follow the rules of the road and stay alert to potential hazards. Some of the most important factors in road safety include obeying speed limits, using seat belts and other safety features, avoiding distractions like texting or phone calls while driving, and maintaining vehicles in good condition.\n\nRoad safety also involves taking steps to make roads and intersections safer, such as installing traffic lights, crosswalks, and barriers where needed. By prioritizing road safety, we can reduce the risk of accidents and injuries, save lives, and create a safer and more secure environment for all road users.',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        wordSpacing: 1.5,
                        height: 1.5),
                  ),
                 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
