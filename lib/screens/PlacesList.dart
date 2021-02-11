import 'package:flutter/material.dart';
import 'package:places/screens/AddPlaces.dart';

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AddPlaces.route);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
