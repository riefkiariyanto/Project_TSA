import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddAnimalController extends GetxController {
  late TextEditingController animalNameController;
  late TextEditingController sexController;
  late TextEditingController descriptionController;
  late TextEditingController weightController;
  late TextEditingController ageController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void AddAnimal(
    String animalName,
    String sex,
    String description,
    String weight,
    String age,
  ) async {
    CollectionReference animals = firestore.collection("animals");

    try {
      await animals.add({
        'animalName': animalName,
        'sex': sex,
        'description': description,
        'age': age,
        'weight': weight,
      });

      Get.defaultDialog(
          title: "Succsess",
          middleText: "Succsess add Animal",
          onConfirm: () => {
                animalNameController.clear(),
                sexController.clear(),
                descriptionController.clear(),
                ageController.clear(),
                weightController.clear(),
                Get.back()
              },
          textConfirm: "okay ");
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Error",
        middleText: "Dont add animal",
      );
    }
  }

  @override
  void onInit() {
    animalNameController = TextEditingController();
    sexController = TextEditingController();
    descriptionController = TextEditingController();
    weightController = TextEditingController();
    ageController = TextEditingController();
  }

  @override
  void onClose() {
    animalNameController.dispose();
    sexController.dispose();
    descriptionController.dispose();
    weightController.dispose();
    ageController.dispose();
    super.onClose();
  }
}
