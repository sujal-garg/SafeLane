// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safelane/authentication/google_auth.dart';
import 'package:safelane/tabs/profile.dart';
import 'draggableItemsModel.dart';
import 'package:safelane/tabs/about.dart';

class DraggableItems extends StatelessWidget {
  const DraggableItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width * 0.85,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 60,
              height: 7,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SettingButtons(
              onTap: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Profile()),
              );},
              textLabel: 'My Profile',
              child: const Icon(Icons.person),
            ),
            SettingButtons(
              onTap: () {},
              textLabel: 'Notifications',
              child: const Icon(Icons.notifications),
            ),
            SettingButtons(
              onTap: () {Navigator.push(context,
               MaterialPageRoute(builder: (_)=> const AboutUs()));

              },
              textLabel: 'About',
              child: const Icon(Icons.info),
            ),
            SettingButtons(
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const GoogleAuth()));
                });
              },
              textLabel: 'Log Out',
              child: const Icon(Icons.logout),
            )
          ],
        ),
      ),
    );
  }
}
