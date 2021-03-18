import 'package:flutter/material.dart';

import 'models/category.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({this.id, this.title, this.color});

  void _onCategoryItemPressed(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/categories",
      arguments: Category(id, title, color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onCategoryItemPressed(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.only(left: 15, top: 15),
        margin: EdgeInsets.only(top: 15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.7),
                  color,
                ])),
      ),
    );
  }
}
