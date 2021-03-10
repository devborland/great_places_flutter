import 'package:flutter/material.dart';

import '../widgets/image_input.dart';

class AddPlacePage extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    SizedBox(height: 8.0),
                    ImageInput(),
                  ],
                ),
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              //...submit
            },
            icon: Icon(Icons.add),
            label: Text('Add Place'),
            style: TextButton.styleFrom(
              primary: Colors.black,
              backgroundColor: Theme.of(context).accentColor,
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
          )
        ],
      ),
    );
  }
}
