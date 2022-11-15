import 'dart:ui';
import 'package:adoptme/change_password.dart';
import 'package:adoptme/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference animals = firestore.collection("animals");
    return animals.snapshots();
  }

// dicument id
  List<String> docIDs = [];
//  get doc
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('user').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }

  final double coverHeight = 215;
  final double profileHeight = 100;
  final double biodata = 245;
  @override
  Widget build(BuildContext context) {
    final bottom = profileHeight - biodata;
    final top = coverHeight - profileHeight / 2;
    final up = coverHeight - profileHeight;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // StreamBuilder<QuerySnapshot<Object?>>(stream: streamData(),builder:(context, snapshot) {
          //   print(snapshot.data!.docs);
          //     if (snapshot.connectionState == ConnectionState.active){
          //        var listAllDocs = snapshot.data!.docs;
          //     }},),
          buildCoverImgae(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              butonArrow(context),
            ],
          ),
          Positioned(
            top: top,
            child: profileImage(),
          ),
          Positioned(
            bottom: up,
            child: Column(
              children: [
                Text(
                  'Viola',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 25,
                  ),
                ),
                detailBio(),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              logoutbtn(context),
              SizedBox(
                height: 10,
              ),
              changebtn(context),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }

//logout Button
  logoutbtn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50.0,
      ),
      child: GestureDetector(
        onTap: () {
          FirebaseAuth.instance.signOut();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: Colors.red[400],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              'LogOut',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

//change password button
  changebtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Change ',
          style: TextStyle(
            fontFamily: 'Gilroy',
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ChangePassword();
                },
              ),
            );
          },
          child: Text(
            'Password',
            style: TextStyle(
              color: Colors.yellow[700],
              fontFamily: 'Gilroy',
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  buildCoverImgae() {
    return Container(
      color: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        child: Image.asset('images/bgprofile.jpg',
            width: double.infinity, height: coverHeight, fit: BoxFit.cover),
      ),
    );
  }

  profileImage() {
    return CircleAvatar(
      radius: profileHeight / 2,
      backgroundImage: AssetImage(
        "Images/catAset.jpg",
      ),
    );
  }

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
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                CupertinoIcons.arrow_left,
                size: 25,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  detailBio() {
    return Container(
      width: 350,
      height: 270,
      child: Card(
        child: Column(
          children: [
            FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                  return ListTile(
                    leading: Icon(Icons.email),
                    title: Text(user.email!),
                  );
                }),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(Icons.phone_iphone),
              title: Text('089666109666'),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Malang'),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('21'),
            ),
          ],
        ),
      ),
    );
  }
}
