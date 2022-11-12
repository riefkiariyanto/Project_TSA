import 'dart:ui';

import 'package:adoptme/change_password.dart';
import 'package:adoptme/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double coverHeight = 250;
  final double profileHeight = 100;
  final double biodata = 555;
  @override
  Widget build(BuildContext context) {
    final bottom = profileHeight - biodata;
    final top = coverHeight - profileHeight / 2;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
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
              bottom: bottom,
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
                    height: 20,
                  ),
                  logoutbtn(context),
                  SizedBox(
                    height: 20,
                  ),
                  changebtn(context),
                ],
              )

              // changebtn(context),
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
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 160),
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
      width: 400,
      height: 262,
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.email),
              title: Text('vi@gmail.com'),
            ),
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
