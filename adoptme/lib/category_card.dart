import 'dart:js';

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
          _bottomsheet(context);
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

  _bottomsheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 650,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  categoryName,
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
