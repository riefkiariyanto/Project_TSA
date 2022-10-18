import 'package:flutter/material.dart';

class AnimalCard extends StatelessWidget {
  const AnimalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepPurple[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Brino',
                  style: TextStyle(fontFamily: 'Gilroy', fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Kediri')
              ],
            ),
            //picture Pet
            Image.asset(
              'images/dasboard.PNG',
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
