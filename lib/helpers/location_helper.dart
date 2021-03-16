const GOOGLE_API_KEY = 'AIzaSyBg9yn5JtQgKRFbg6FCTy4ewbF24kRuAYI';

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
    print(imgUrl);
    return imgUrl;
  }
}
