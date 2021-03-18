import 'package:flutter/material.dart';

class FavouritesScreen extends StatefulWidget {
  static const ROUTE = "/favourites_screen";

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Favourites screen."),
      alignment: Alignment.center,
    );
  }
}
