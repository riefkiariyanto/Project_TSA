import 'package:flutter/material.dart';

class AnimalCard extends StatelessWidget {
  // const AnimalCard({super.key});
  final String animalName;
  final String animalLocation;

  AnimalCard({
    required this.animalName,
    required this.animalLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        width: 240,
        decoration: BoxDecoration(
          color: Colors.deepPurple[300],
          borderRadius: BorderRadius.circular(25),
          image: new DecorationImage(
            image: AssetImage(
              'images/catlist.PNG',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 7),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animalName,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Gilroy',
                        fontSize: 26),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    animalLocation,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
