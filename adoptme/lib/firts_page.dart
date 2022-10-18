import 'package:adoptme/animal_card.dart';
import 'package:adoptme/category_card.dart';
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
                          fontSize: 17,
                          color: Colors.grey[700]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(CupertinoIcons.arrow_turn_right_down,
                        color: Colors.blue[400], size: 21.0)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Malang, Jawa Timur',
                      style: TextStyle(fontFamily: 'Gilroy', fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                // Card dasboard
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/dasboard.PNG'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Join Our Animal',
                              style:
                                  TextStyle(fontFamily: 'Gilroy', fontSize: 18),
                            ),
                            Text(
                              'loversComuniti',
                              style:
                                  TextStyle(fontFamily: 'Gilroy', fontSize: 18),
                            ),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.orange[300],
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Text(
                                  'Join Now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Gilroy',
                                      fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Categories ',
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 70,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryCard(
                        categoryName: 'Cat',
                      ),
                      CategoryCard(
                        categoryName: 'dog',
                      ),
                      CategoryCard(
                        categoryName: 'fish',
                      ),
                      CategoryCard(
                        categoryName: 'bird',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Animal list',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),

                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      AnimalCard(),
                      AnimalCard(),
                      AnimalCard(),
                      AnimalCard(),
                      AnimalCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
