import 'package:adoptme/List_Controller.dart';
import 'package:adoptme/detail_animal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimalListView extends GetView<ListController> {
  final controller = Get.put(ListController());

  final authController = Get.find<ListController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot<Object?>>(
            stream: controller.streamData(),
            builder: (context, snapshot) {
              print(snapshot.data!.docs);
              if (snapshot.connectionState == ConnectionState.active) {
                var listAllDocs = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: Image.asset(
                      'images/listPic.jpeg',
                      width: 70,
                      height: 130,
                    ),
                    title: Text(
                        "${(listAllDocs[index].data() as Map<String, dynamic>)["animalName"]}"),
                    subtitle: Text(
                        "${(listAllDocs[index].data() as Map<String, dynamic>)["description"]}"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailAnimal(),
                      ));
                    },
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
