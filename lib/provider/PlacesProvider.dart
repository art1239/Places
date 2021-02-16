import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:places/models/place.dart';

class Places with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get fetchPlaces {
    return [..._places];
  }

  void addPlaces({String id, String title, File image, String location}) {
    final place = Place(
      id: id,
      title: title,
      image: image,
      location: location,
    );
    _places.add(place);
    notifyListeners();
  }
}
