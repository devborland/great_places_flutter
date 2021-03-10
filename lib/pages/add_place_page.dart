import 'package:flutter/material.dart';

class AddPlacePage extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('User inputs...'),
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
