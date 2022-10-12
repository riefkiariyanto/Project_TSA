import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 21,
                          color: Colors.grey[700]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(CupertinoIcons.arrow_turn_right_down,
                        color: Colors.blue[400], size: 25.0)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Malang, Jawa Timur',
                      style: TextStyle(fontFamily: 'Gilroy', fontSize: 23),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.count(crossAxisCount: 2, children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[400],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
