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
      body: Column(
        children: [
          // appbar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 17,
                            color: Colors.grey[700],
                          ),
                        ),
                        Icon(
                          CupertinoIcons.arrow_turn_right_down,
                          color: Colors.blue[400],
                          size: 18.0,
                        ),
                      ],
                    ),
                    Text(
                      'Malang, Jawa Timur',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                // search Button
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Icon(
                          CupertinoIcons.search,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),

          // cardDasboard
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(children: [
                Container(
                  height: 150,
                  width: 120,
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
                        style: TextStyle(fontFamily: 'Gilroy', fontSize: 18),
                      ),
                      Text(
                        'loversComuniti',
                        style: TextStyle(fontFamily: 'Gilroy', fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
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
            height: 30,
          ),

          // Categories
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Categories ',
                  style: TextStyle(
                      fontFamily: 'Gilroy', fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),

          Container(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryCard(
                  categoryName: 'Cat',
                  iconImagePath: 'images/icon/cat.png',
                ),
                CategoryCard(
                  categoryName: 'dog',
                  iconImagePath: 'images/icon/dog.png',
                ),
                CategoryCard(
                  categoryName: 'fish',
                  iconImagePath: 'images/icon/fish.png',
                ),
                CategoryCard(
                  categoryName: 'bird',
                  iconImagePath: 'images/icon/bird.png',
                ),
                CategoryCard(
                  categoryName: 'fish',
                  iconImagePath: 'images/icon/fish.png',
                ),
                CategoryCard(
                  categoryName: 'bird',
                  iconImagePath: 'images/icon/bird.png',
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),

          // listView
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
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                AnimalCard(
                  animalName: 'asep',
                  animalLocation: 'Malang',
                ),
                AnimalCard(
                  animalName: 'juned',
                  animalLocation: 'Surabaya',
                ),
                AnimalCard(
                  animalName: 'sapri',
                  animalLocation: 'Sidoarjo',
                ),
                AnimalCard(
                  animalName: 'harto',
                  animalLocation: 'Madiun',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
