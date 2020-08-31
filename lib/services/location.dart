import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoding_platform_interface/geocoding_platform_interface.dart';

class LocationSunny {
  double latitude;
  double longitude;
  String cityName;
  String countryName;

  Future<void> getLocation() async {
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;

      List<Placemark> locationName = await placemarkFromCoordinates(
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
      List<Location> coordinates = await locationFromAddress(chosenCity);

      latitude = coordinates[0].latitude;
      longitude = coordinates[0].longitude;

      List<Placemark> locationName = await placemarkFromCoordinates(
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
