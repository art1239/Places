import 'package:flutter/material.dart';
import 'package:places/screens/AddPlaces.dart';

import 'screens/PlacesList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
      ),
      home: PlacesList(),
      routes: {
        AddPlaces.route: (ctx) => AddPlaces(),
      },
    );
  }
}
