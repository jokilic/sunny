import 'package:flutter/material.dart';
import 'package:sunny/colors.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ['Today', 'Week'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Text(
                  categories[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  decoration: BoxDecoration(
                    color:
                        selectedIndex == index ? textColor : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  width: 8.0,
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
