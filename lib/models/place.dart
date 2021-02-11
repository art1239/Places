import 'dart:io';

import 'package:flutter/cupertino.dart';

class Places with ChangeNotifier {
  String id;
  String title;
  String location;
  File image;
  Places({
    this.id,
    this.title,
    this.location,
    this.image,
  });
}
