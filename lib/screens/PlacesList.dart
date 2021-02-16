import 'package:flutter/material.dart';
import 'package:places/provider/PlacesProvider.dart';
import 'package:places/screens/AddPlaces.dart';
import 'package:provider/provider.dart';

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
        child: Consumer<Places>(
          child: Center(
            child: Text(
              'No places yet',
            ),
          ),
          builder: (context, places, child) => places.fetchPlaces.length > 0
              ? ListView.builder(
                  itemCount: places.fetchPlaces.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: FileImage(
                          places.fetchPlaces[index].image,
                        ),
                      ),
                      title: Text(places.fetchPlaces[index].title),
                    );
                  },
                )
              : child,
        ),
      ),
    );
  }
}
