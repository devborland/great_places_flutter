import 'package:flutter/material.dart';

import 'add_place_page.dart';

class PlacesListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              //...
              Navigator.of(context).pushNamed(AddPlacePage.routeName);
            },
          ),
        ],
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
