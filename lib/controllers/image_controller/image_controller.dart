import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safelane/tabs/home.dart';
import 'package:uuid/uuid.dart';

class ImageController extends GetxController {
  final cloudFirestore = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance;
  final uuid = const Uuid();

  Future<dynamic> uploadImage(
      File? image, String obstacleType, String detail) async {
    RxString downloadLink = ''.obs;
    final storageInsance = firebaseStorage.ref();
    final user = FirebaseAuth.instance.currentUser;

    Get.defaultDialog(
        title: 'Uploading...',
        content: const CircularProgressIndicator(),
        barrierDismissible: true);

    try {
      final imageName = uuid.v1();

      await storageInsance.child('images/$imageName.png').putFile(image!);

      final downloadLink =
          await storageInsance.child('images/$imageName.png').getDownloadURL();

      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      
      final latitude = currentPosition.latitude;
      final longitude = currentPosition.longitude;

      // Getting Current Address
      final placemarks = await placemarkFromCoordinates(latitude, longitude);
      final exactLocation = placemarks[0];
  
      await cloudFirestore.collection('potholes').doc(uuid.v1()).set({
        'latitude': currentPosition.latitude,
        'longitude': currentPosition.longitude,
        'place' : exactLocation.locality,
        'downloadLink': downloadLink,
        'uploadedBy': user!.email,
        'obstacleType': obstacleType,
        'details': detail
      });

      Get.offAll(const HomePage());
      print('Upload Completed');
    } catch (err) {
      print(err);
    }
  }
}
