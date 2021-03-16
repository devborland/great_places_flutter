import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart' as ym;
// import 'package:google_maps/google_maps.dart';
import '../models/place.dart';

class MapPage extends StatefulWidget {
  static const routeName = '/map-page';
  final PlaceLocation initialLocation;
  final bool isSelecting;

  MapPage({this.initialLocation, this.isSelecting = false});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  ym.YandexMapController mapController;

  void _onMapCreated(ym.YandexMapController controller) {
    mapController = controller;
  }

  Future<void> _onMapRendered() async {
    var point = ym.Point(
      latitude: widget.initialLocation.latitude,
      longitude: widget.initialLocation.longitude,
    );
    mapController.move(point: point);
    mapController.addPlacemark(
      ym.Placemark(
        point: point,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.check),
            label: Text('Pick'),
          )
        ],
      ),
      body: ym.YandexMap(
        onMapCreated: _onMapCreated,
        onMapRendered: _onMapRendered,
      ),
    );
  }
}
