import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safelane/controllers/image_controller/image_controller.dart';

class Contribute extends StatefulWidget {
  const Contribute({super.key});

  @override
  State<Contribute> createState() => _ContributeState();
}

class _ContributeState extends State<Contribute> {
  File? image;
  TextEditingController detailsTextController = TextEditingController();

  final imageController = Get.put(ImageController());

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Contribute",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            alignment: Alignment.topLeft,
            width: size.width * 0.8,
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: size.width,
                      child: const Text("Select obstacle type"),
                    ),
                    const DropDownButton(),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                // Column(
                //   children: [
                //     Container(
                //         width: size.width,
                //         margin: const EdgeInsets.only(bottom: 10.0),
                //         child: const Text("Location")),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Container(
                //           padding: const EdgeInsets.all(10),
                //           alignment: Alignment.center,
                //           width: size.width * 0.5,
                //           height: 80,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //             color: const Color(0xfff2f2f2),
                //           ),
                //           child: Text(
                //             locationMessage,
                //           ),
                //         ),
                //         ElevatedButton(
                //             onPressed: (() {
                //               _getCurrentLocation().then((value) {
                //                 lat = '${value.latitude}';
                //                 long = '${value.longitude}';
                //                 setState(() {
                //                   locationMessage =
                //                       'Latitude : $lat, Longitude: $long';
                //                 });
                //               });
                //             }),
                //             child: const Text('Locate')),
                //       ],
                //     ),
                //     const SizedBox(
                //       height: 20,
                //     )
                //   ],
                // ),
                Column(
                  children: [
                    Container(
                      width: size.width,
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: const Text("Upload images"),
                    ),
                    InkWell(
                      onTap: (() {
                        pickImage();
                      }),
                      child: image != null
                          ? Image.file(
                              image!,
                              width: 200,
                              height: 160,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              width: size.width,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xfff2f2f2),
                              ),
                              child: const Center(
                                child: Text("Tap to upload image"),
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                        width: size.width,
                        margin: const EdgeInsets.only(bottom: 5.0),
                        child: const Text("Details")),
                    Container(
                      width: size.width,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xfff2f2f2),
                      ),
                      child: TextField(
                        controller: detailsTextController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          hintText: "Fill the description here...",
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        elevation: 10,
                      ),
                      onPressed: () {
                        imageController.uploadImage(
                            image, dropdownValue, detailsTextController.text);
                      },
                      child: const Text("Post"),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 80,
                      height: 2,
                    ),
                    // Text(
                    //   "Also",
                    //   style: GoogleFonts.poppins(
                    //       fontWeight: FontWeight.bold,
                    //       color: Color.fromARGB(255, 0, 0, 0)),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.only(left: 20),
                    //   color: Color.fromARGB(255, 1, 1, 1),
                    //   width: 80,
                    //   height: 2,
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: size.width * 0.8,
                  height: 40,
                  child: OutlinedButton(
                    //button function here
                    onPressed: () {},
                    style: ButtonStyle(
                    side: MaterialStateProperty.all(const BorderSide(
                        color: Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid))),
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.report,
                          size: 32,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          "Report to Government",
                          style: TextStyle(fontSize: 16, color: Colors.black),
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

List<String> list = <String>['Pothole', 'Open Manhole', 'Other'];

String dropdownValue = list.first;

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
      decoration: BoxDecoration(
        color: const Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButton<String>(
        elevation: 3,
        isExpanded: true,
        value: dropdownValue,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black,
        ),
        style: const TextStyle(color: Colors.black),
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
      ),
    );
  }
}
