import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart' as ym;
// import 'package:google_maps/google_maps.dart';
import '../models/place.dart';

class MapPage extends StatefulWidget {
  static const routeName = '/map-page';
  final PlaceLocation initialLocation;

  MapPage({this.initialLocation});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  ym.YandexMapController mapController;
  var _pickedLocation = PlaceLocation(
    latitude: 0.0,
    longitude: 0.0,
  );

  void _onMapCreated(ym.YandexMapController controller) {
    try {
      mapController = controller;
    } catch (e) {
      print(e);
    }
  }

  Future<void> _setPoint() async {
    var point = ym.Point(
      latitude: widget.initialLocation.latitude,
      longitude: widget.initialLocation.longitude,
    );
    _pickedLocation.latitude = point.latitude;
    _pickedLocation.longitude = point.longitude;
    mapController.move(point: point);
    mapController.addPlacemark(ym.Placemark(point: point));
  }

  void _selectLocation(ym.Point point) {
    mapController.removePlacemark(mapController.placemarks.last);
    mapController.addPlacemark(ym.Placemark(point: point));

    _pickedLocation.latitude = point.latitude;
    _pickedLocation.longitude = point.longitude;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
        actions: [
          IconButton(
            onPressed: () {
              mapController.dispose();
              Navigator.of(context).pop(_pickedLocation);
            },
            icon: Icon(Icons.check),
          )
        ],
      ),
      body: ym.YandexMap(
        onMapCreated: _onMapCreated,
        onMapRendered: _setPoint,
        onMapTap: _selectLocation,
      ),
    );
  }
}
