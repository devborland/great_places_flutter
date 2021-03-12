import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:great_places_flutter/models/place.dart';

import '../models/place.dart';
import '../helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      image: image,
      location: null,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchPlaces() async {
    final dataList = await DBHelper.getData('user_places');

    _items = dataList.map(
      (item) {
        return Place(
          id: item['id'],
          title: item['title'],
          location: null,
          image: File(item['image']),
        );
      },
    ).toList();
    notifyListeners();
  }
}
