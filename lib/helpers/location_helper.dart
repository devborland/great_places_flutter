import 'dart:convert';
import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'AIzaSyBg9yn5JtQgKRFbg6FCTy4ewbF24kRuAYI';
const YANDEX_API_KEY = 'cfad7cb3-e76c-45f2-955a-58707117abee';
const YANDEX_GEOCODER_API_KEY = 'c69b19fb-d163-4d6c-b5f7-2e85f021efdb';

class LocationHelper {
  static String generateLocationPreviewImage({
    double latitude,
    double longitude,
  }) {
    String imgUrl = 'https://static-maps.yandex.ru/1.x/?' +
        'z=14' +
        '&l=map' +
        '&ll=$longitude,$latitude' +
        '&size=650,450' +
        '&scale=2.0' +
        '&pt=$longitude,$latitude,comma' +
        '&lang=ru_RU';

    return imgUrl;
  }

  static Future<String> getPlaceAddress(
    double lat,
    double lng,
  ) async {
    var url = Uri.parse(
      'https://geocode-maps.yandex.ru/1.x' +
          '?apikey=$YANDEX_GEOCODER_API_KEY' +
          '&geocode=$lng,$lat' +
          '&format=json' +
          '&lang=ru_Ru',
    );
    print(url);
    final responce = await http.get(url);

    final Map<String, dynamic> responceData = json.decode(responce.body) as Map;

    String city = responceData['response']['GeoObjectCollection']
        ['featureMember'][0]['GeoObject']['description'];
    String address = responceData['response']['GeoObjectCollection']
        ['featureMember'][0]['GeoObject']['name'];

    print(address + ' ' + city);
    return address + ' ' + city;
  }
}
