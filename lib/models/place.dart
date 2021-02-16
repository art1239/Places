import 'dart:io';

class Place {
  final String id;
  final String title;
  final String location;
  final File image;
  const Place({
    this.id,
    this.title,
    this.location,
    this.image,
  });
}
