import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    try {
      final imageFile = await picker.getImage(
        source: ImageSource.camera,
        maxWidth: 600,
      );
      setState(() {
        _storedImage = File(imageFile.path);
      });
      final appDir = await syspaths.getApplicationDocumentsDirectory();
      final fileName = path.basename(imageFile.path);
      print(appDir.path + '/' + fileName);
      final savedImage = await _storedImage.copy(appDir.path + '/' + fileName);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No image taken', textAlign: TextAlign.center),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera),
            label: Text('Take Picture'),
          ),
        ),
      ],
    );
  }
}
