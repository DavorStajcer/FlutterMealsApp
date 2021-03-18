import 'package:MealsApp/screens/favourites_screen.dart';
import 'package:MealsApp/screens/tab_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  ListTile _generateDrawerTile(
          {String title, Icon icon, void Function() onTilepressed}) =>
      ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onTap: onTilepressed,
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            child: Text(
              "Coocking Up !",
              style: Theme.of(context).textTheme.headline3.copyWith(
                  fontSize: 25,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            height: 150,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 20,
          ),
          _generateDrawerTile(
              title: "Meals",
              icon: Icon(Icons.restaurant),
              onTilepressed: () {
                Navigator.of(context).pushReplacementNamed(TabsScreen.ROUTE);
              }),
          _generateDrawerTile(
              title: "Filters",
              icon: Icon(Icons.settings),
              onTilepressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(FavouritesScreen.ROUTE);
              }),
        ],
      ),
    );
  }
}
