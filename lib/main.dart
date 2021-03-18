import 'package:MealsApp/screens/favourites_screen.dart';
import 'package:MealsApp/screens/meal_description_screen.dart';
import 'package:MealsApp/screens/tab_screen.dart';
import 'package:flutter/material.dart';

import 'screens/category_screen.dart';
import 'package:MealsApp/screens/category_meals_screen.dart';

void main() {
  runApp(MealsApp());
}

class MealsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: TabsScreen.ROUTE,
      title: "DeliMeals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline4: TextStyle(
                fontFamily: "Raleway",
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline3: TextStyle(
                fontFamily: "Raleway",
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontFamily: "RobotoCondensed", fontWeight: FontWeight.bold),
            ),
      ),
      routes: {
        TabsScreen.ROUTE: (_) => TabsScreen(),
        CategoryMealScreen.ROUTE: (_) => CategoryMealScreen(),
        MealDescriptionScreen.ROUTE: (_) => MealDescriptionScreen(),
        CategoryScreen.ROUTE: (_) => CategoryScreen(),
        FavouritesScreen.ROUTE: (_) => FavouritesScreen(),
      },
    );
  }
}
