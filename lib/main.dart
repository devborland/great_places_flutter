import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/great_places.dart';

import 'pages/add_place_page.dart';
import 'pages/places_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Creat Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListPage(),
        routes: {
          AddPlacePage.routeName: (ctx) => AddPlacePage(),
        },
      ),
    );
  }
}
