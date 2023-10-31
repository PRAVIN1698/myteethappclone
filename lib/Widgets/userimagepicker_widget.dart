import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class useriimagepicker extends StatefulWidget {
  const useriimagepicker({super.key, required this.onPickedImage});

  final void Function(File pickedImage) onPickedImage;

  @override
  State<useriimagepicker> createState() => _useriimagepickerState();
}

class _useriimagepickerState extends State<useriimagepicker> {
  File? _pickedImageFile;

  void pickerImage() async {
    final _pickImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (_pickImage == null) {
      return;
    }

    setState(() {
      _pickedImageFile = File(_pickImage.path);
    });

    widget.onPickedImage(_pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage:
              _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
        ),
        TextButton.icon(
            onPressed: pickerImage,
            icon: Icon(Icons.image),
            label: Text(
              'Add image',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ))
      ],
    );
  }
}
