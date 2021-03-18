import 'package:flutter/material.dart';

import 'package:MealsApp/screens/category_screen.dart';
import 'package:MealsApp/screens/custom_drawer.dart';
import 'package:MealsApp/screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  static const ROUTE = "/";

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _tabScreens = [
    {
      "page": CategoryScreen(),
      "title": "Categories",
    },
    {
      "page": FavouritesScreen(),
      "title": "Favourites",
    }
  ];

  int _currentScreenIndex = 0;

  void _onBottomNavigationBarTaped(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabScreens[_currentScreenIndex]["title"]),
      ),
      body: _tabScreens[_currentScreenIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: _tabScreens[_currentScreenIndex]["title"],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: _tabScreens[_currentScreenIndex]["title"],
          )
        ],
        onTap: _onBottomNavigationBarTaped,
        currentIndex: _currentScreenIndex,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
      ),
      drawer: CustomDrawer(),
    );
  }
}
