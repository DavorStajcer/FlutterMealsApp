import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:MealsApp/models/meal.dart';
import 'package:MealsApp/screens/meal_description_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final void Function(String) _onMealDeleted;

  const MealItem(this.meal, this._onMealDeleted);

  void _onMealPressed(BuildContext context) {
    Navigator.pushNamed(
      context,
      MealDescriptionScreen.ROUTE,
      arguments: meal,
    ).then((value) {
      _onMealDeleted(meal.id);
    });
  }

  String get _complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

  String get _affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return "Simple";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(15),
        )),
        child: InkWell(
          onTap: () => _onMealPressed(context),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        width: constraints.maxWidth * 0.65,
                        child: Text(
                          meal.title,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        color: Colors.black.withOpacity(0.35),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                ),
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20, left: 20),
                        child: Row(
                          children: [
                            Icon(Icons.schedule),
                            SizedBox(
                              width: 6,
                            ),
                            Text("${meal.duration.toString()} min")
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20, left: 20),
                        child: Row(
                          children: [
                            Icon(Icons.work),
                            SizedBox(
                              width: 6,
                            ),
                            Text("$_complexityText")
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20, left: 20),
                        child: Row(
                          children: [
                            Icon(Icons.attach_money),
                            SizedBox(
                              width: 6,
                            ),
                            Text("$_affordabilityText")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
