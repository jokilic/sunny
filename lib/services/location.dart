import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  String cityName;
  String countryName;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;

      List<Placemark> locationName =
          await Geolocator().placemarkFromCoordinates(
        latitude,
        longitude,
        // localeIdentifier: 'hr_HR',
      );

      cityName = locationName[0].locality;
      countryName = locationName[0].country;
    } catch (e) {
      print('Sunny: Location Error - getLocation() - $e');
    }
  }

  Future<void> getCoordinates(chosenCity) async {
    try {
      List<Placemark> coordinates =
          await Geolocator().placemarkFromAddress(chosenCity);

      latitude = coordinates[0].position.latitude;
      longitude = coordinates[0].position.longitude;

      List<Placemark> locationName =
          await Geolocator().placemarkFromCoordinates(
        latitude,
        longitude,
        // localeIdentifier: 'hr_HR',
      );

      cityName = locationName[0].locality;
      countryName = locationName[0].country;
    } catch (e) {
      print('Sunny: Location Error - getCoordinates() - $e');
    }
  }
}
