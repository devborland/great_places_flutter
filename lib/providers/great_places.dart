import 'package:flutter/foundation.dart';
import 'package:great_places_flutter/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Places> _items = [];

  List<Places> get items {
    return [..._items];
  }
}
