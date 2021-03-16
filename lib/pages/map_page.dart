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
    mapController.move(
      point: ym.Point(
        latitude: widget.initialLocation.latitude,
        longitude: widget.initialLocation.longitude,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          ym.YandexMap(
            onMapCreated: _onMapCreated,
            onMapRendered: _onMapRendered,
          ),
          Column(
            children: [
              FloatingActionButton(
                mini: true,
                onPressed: () {},
                child: Icon(Icons.add),
              ),
              // SizedBox(height: 4.0),
              FloatingActionButton(
                mini: true,
                onPressed: () {},
                child: Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
