import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/great_places.dart';

import 'map_page.dart';

class PlaceDetailPage extends StatelessWidget {
  static const String routeName = '/place-detail-page';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              selectedPlace.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 12.0),
          Text(
            selectedPlace.location.address,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (ctx) => MapPage(
                    initialLocation: selectedPlace.location,
                  ),
                ),
              );
            },
            child: Text('View on Map'),
          )
        ],
      ),
    );
  }
}
