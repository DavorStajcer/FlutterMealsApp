import 'package:flutter/material.dart';

import '../dummy_data.dart';

class CategoryScreen extends StatefulWidget {
  static const ROUTE = "/category_screen";

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 2.5,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10),
        children: DUMMY_CATEGORIES,
      ),
    );
  }
}
