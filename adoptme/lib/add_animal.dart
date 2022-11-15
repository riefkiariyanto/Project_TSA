import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:adoptme/add_animal_controller.dart';

class AddAnimal extends StatefulWidget {
  State<AddAnimal> createState() => _AddAnimal();
}

class _AddAnimal extends State<AddAnimal> {
  final controller = Get.put(AddAnimalController());
  File? myImage;
  UploadTask? uploadTask;
  PickedFile? pickedFile;

  final ImagePicker _picker = ImagePicker();

  getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      myImage = File(image.path);
      setState(() {});
      Get.back();
    }
  }

  void uploadFiles() async {
    final file = myImage!;
    final maetaData = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref =
        storageRef.child('images/${DateTime.now().microsecondsSinceEpoch}');
    final UploadTask = ref.putFile(file, maetaData);

    uploadTask?.snapshotEvents.listen((event) {
      switch (event.state) {
        case TaskState.running:
          print("file is upload");
          break;
        case TaskState.success:
          ref.getDownloadURL().then((value) {});
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 25),
              Text(
                'Add Animal',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Hello !!
              myImage != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(9),
                        child: Image.file(
                          File(myImage!.path),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 400,
                        ),
                      ),
                    )
                  : Text(
                      "Add Photos",
                      style: TextStyle(fontSize: 20),
                    ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  controller: controller.animalNameController,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'animal name',
                      fillColor: Colors.grey[100],
                      filled: true),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                    controller: controller.sexController,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'sex',
                        fillColor: Colors.grey[100],
                        filled: true)),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                    controller: controller.ageController,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Age',
                        fillColor: Colors.grey[100],
                        filled: true)),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                    controller: controller.weightController,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'weight',
                        fillColor: Colors.grey[100],
                        filled: true)),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                    controller: controller.descriptionController,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Description',
                        fillColor: Colors.grey[100],
                        filled: true)),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: GestureDetector(
                      onTap: () {
                        myAlert();
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Add photo',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: GestureDetector(
                      // onTap: uploadFiles,
                      onTap: () => controller.AddAnimal(
                          controller.animalNameController.text,
                          controller.sexController.text,
                          controller.descriptionController.text,
                          controller.weightController.text,
                          controller.ageController.text),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Add',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 7,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
