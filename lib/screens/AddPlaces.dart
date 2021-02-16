import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/provider/PlacesProvider.dart';
import 'package:places/widget/imageInput.dart';
import 'package:provider/provider.dart';

class AddPlaces extends StatefulWidget {
  static const route = '/addPlaces';

  @override
  _AddPlacesState createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {
  TextEditingController _controller = TextEditingController();
  File fileImage;
  selectImage(File file) {
    fileImage = file;
  }

  void saveChanges() {
    if (_controller.text.isEmpty || fileImage == null) {
      return;
    }
    Provider.of<Places>(context, listen: false).addPlaces(
      title: _controller.text,
      id: DateTime.now().toString(),
      image: fileImage,
      location: null,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a place'),
      ),
      body: Form(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _controller,
                      style: TextStyle(),
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ImageInput(selectImage),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.grey[300],
              child: TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    Text(
                      '  Add Place',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                onPressed: () {
                  saveChanges();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
