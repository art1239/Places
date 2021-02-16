import 'package:flutter/material.dart';
import 'package:places/screens/AddPlaces.dart';
import 'package:provider/provider.dart';

import 'provider/PlacesProvider.dart';
import 'screens/PlacesList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Places(),
        ),
      ],
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesList(),
        routes: {
          AddPlaces.route: (ctx) => AddPlaces(),
        },
      ),
    );
  }
}
