import 'package:flutter/material.dart';
import 'package:great_places_flutter/models/place.dart';
import '../pages/map_page.dart';
import 'package:location/location.dart';

import '../helpers/location_helper.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPlace;
  LocationInput(this.onSelectPlace);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _showPreview(double lat, double lng) async {
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      latitude: lat,
      longitude: lng,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _getCurrentLocation() async {
    try {
      final locData = await Location().getLocation();
      _showPreview(locData.latitude, locData.longitude);
      widget.onSelectPlace(locData.latitude, locData.longitude);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _selectOnMap() async {
    final locData = await Location().getLocation();

    final PlaceLocation selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapPage(
          initialLocation: PlaceLocation(
            latitude: locData.latitude,
            longitude: locData.longitude,
          ),
        ),
      ),
    );

    if (selectedLocation == null) {
      print('NO LOCATION');
      return;
    }

    LocationHelper.getPlaceAddress(
      selectedLocation.latitude,
      selectedLocation.longitude,
    );

    _showPreview(selectedLocation.latitude, selectedLocation.longitude);
    widget.onSelectPlace(selectedLocation.latitude, selectedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
            width: 1.0,
            color: Colors.grey,
          )),
          child: _previewImageUrl == null
              ? Text(
                  'No location chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              icon: Icon(Icons.map),
              label: Text('Select on Map'),
            ),
          ],
        ),
      ],
    );
  }
}
