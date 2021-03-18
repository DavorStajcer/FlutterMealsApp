import 'package:flutter/material.dart';

import "../models/meal.dart";

class MealDescriptionScreen extends StatefulWidget {
  static const String ROUTE = "/meal_description_screen";

  @override
  _MealDescriptionScreenState createState() => _MealDescriptionScreenState();
}

class _MealDescriptionScreenState extends State<MealDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final Size availableSize = MediaQuery.of(context).size;
    final Meal meal = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Padding(
            padding: EdgeInsets.only(right: 80),
            child: Text(
              meal.title,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
        ),
        onPressed: () {
          Navigator.of(context).pop(meal.id);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            SizedBox(
              width: double.infinity,
              height: 10,
            ),
            Text(
              "Ingridients",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              width: double.infinity,
              height: 10,
            ),
            Container(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Text(meal.ingredients[index]),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Theme.of(context).primaryColor),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.white,
              ),
              height: availableSize.height * 0.20,
              width: double.infinity,
              margin:
                  EdgeInsets.symmetric(horizontal: availableSize.width * 0.15),
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            SizedBox(
              width: double.infinity,
              height: 10,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              width: double.infinity,
              height: 10,
            ),
            Container(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("# $index"),
                        ),
                        title: Text(
                          meal.steps[index],
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: meal.steps.length,
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.white,
              ),
              height: availableSize.height * 0.20,
              width: double.infinity,
              margin:
                  EdgeInsets.symmetric(horizontal: availableSize.width * 0.15),
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
          ],
        ),
      ),
    );
  }
}
