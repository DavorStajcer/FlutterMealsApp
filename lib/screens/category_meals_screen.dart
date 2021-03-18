import 'package:flutter/material.dart';

import 'package:MealsApp/dummy_data.dart';
import '../models/category.dart';
import '../meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const ROUTE = "/categories";

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  Category category;
  List<MealItem> _filteredMeals;
  bool isDataInit = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isDataInit) {
      category = ModalRoute.of(context).settings.arguments;

      _filteredMeals = DUMMY_MEALS
          .where((meal) {
            return _isMatchingFilters(meal, category);
          })
          .map((meal) => MealItem(
                meal,
                _onMealDeleted,
              ))
          .toList();
      isDataInit = true;
    }
    super.didChangeDependencies();
  }

  void _onMealDeleted(String mealId) {
    print(mealId);
    setState(() {
      print(DUMMY_MEALS.length);
      _filteredMeals.removeWhere((mealItem) => mealItem.meal.id == mealId);
      print(DUMMY_MEALS.length);
    });
  }

  bool _isMatchingFilters(Meal meal, Category category) {
    return meal.categories.contains(category.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text(category.title),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (_, index) {
            return _filteredMeals[index];
          },
          itemCount: _filteredMeals.length,
        ),
      ),
    );
  }
}

/* DUMMY_MEALS.where((meal) {
            return _isMatchingFilters(meal, category);
          }).toList() */
