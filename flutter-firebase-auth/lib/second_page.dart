import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Haii !',
            style: GoogleFonts.bebasNeue(
              fontSize: 52,
            ),
          ),
        ),
      ),
    );
  }
}
