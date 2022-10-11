import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class FirtsPage extends StatefulWidget {
  const FirtsPage({Key? key}) : super(key: key);

  @override
  State<FirtsPage> createState() => _FirtsPageState();
}

class _FirtsPageState extends State<FirtsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Text(
            'Hello !',
            style: (TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 52,
            )),
          ),
        ),
      ),
    );
  }
}
