import 'dart:ui';
import 'package:adoptme/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailAnimal extends StatelessWidget {
  DetailAnimal(this.itemId, {Key? key}) : super(key: key) {
    _reference = FirebaseFirestore.instance.collection('animals').doc(itemId);
    _futureData = _reference.get();
  }
  String itemId;
  late DocumentReference _reference;

  //_reference.get()  --> returns Future<DocumentSnapshot>
  //_reference.snapshots() --> Stream<DocumentSnapshot>
  late Future<DocumentSnapshot> _futureData;
  late Map data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset("images/jokowi.jpg"),
            ),
            butonArrow(context),
            scroll(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  //Back button
  butonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context, new MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                CupertinoIcons.arrow_left,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black12,
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Jokowi",
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Food.",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.grey[400]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      descGender(
                        petGender: 'Male',
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      descAge(
                        petAge: '1 Year',
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      descWight(
                        petWeight: '10kg',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          "Images/catAset.jpg",
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          Text(
                            "Viola",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Gilroy',
                                fontSize: 17),
                          ),
                          SizedBox(),
                          Text(
                            "Owner",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          CupertinoIcons.chat_bubble,
                          size: 20,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          CupertinoIcons.phone,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(fontFamily: 'Gilroy', fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "Kucing disebut juga kucing domestik atau kucing rumah (nama ilmiah: Felis silvestris catus atau Felis catus) adalah sejenis mamalia karnivora dari keluarga Felidae. Kata kucing biasanya merujuk kepada kucing yang telah dijinakkan, tetapi bisa juga merujuk kepada kucing besar seperti singa dan harimau.",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 320,
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [BoxShadow()],
                        ),
                        child: Center(
                          child: Text(
                            'Adopt Me',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

// BOX

// Box detail gender
class descGender extends StatelessWidget {
  final String petGender;

  descGender({required this.petGender});
  // const MyWidget({super.key})

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 100,
              width: 120,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        petGender,
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sex",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

// Box detail age
class descAge extends StatelessWidget {
  final String petAge;

  descAge({required this.petAge});
  // const MyWidget({super.key})

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 100,
              width: 120,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        petAge,
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Age",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

// Box detail weight
class descWight extends StatelessWidget {
  final String petWeight;

  descWight({
    required this.petWeight,
  });
  // const MyWidget({super.key})

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 100,
              width: 120,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        petWeight,
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Weight",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
