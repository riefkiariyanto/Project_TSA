import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String iconImagePath;

  CategoryCard({required this.categoryName, required this.iconImagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50),
              ),
            ),
            builder: (BuildContext context) {
              return Container(
                height: 700,
              );
            },
          );
        },
        child: Container(
          width: 120,
          height: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    iconImagePath,
                    height: 40,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    categoryName,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      color: Colors.black,
                    ),
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
