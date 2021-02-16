import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as customPath;
import 'package:path_provider/path_provider.dart' as systemPath;

class ImageInput extends StatefulWidget {
  final Function selectImage;
  ImageInput(this.selectImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  final picker = ImagePicker();
  File image;

  Future<void> _takeImage() async {
    final cameraImage =
        await picker.getImage(source: ImageSource.camera, maxWidth: 500);
    if (cameraImage == null) {
      return;
    }
    setState(() {
      image = File(cameraImage.path);
    });

    final directory = await systemPath.getApplicationDocumentsDirectory();
    final fileName = customPath.basename(image.path);
    final savedImage = await image.copy('${directory.path}/$fileName');
    widget.selectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.grey),
          ),
          child: Center(
            child: image == null
                ? Text(
                    'No image uploaded',
                    textAlign: TextAlign.center,
                  )
                : Image.file(
                    image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: () {
              _takeImage();
            },
            icon: Icon(Icons.camera),
            label: Text('Take Picture'),
          ),
        ),
      ],
    );
  }
}
