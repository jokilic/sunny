import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoding_platform_interface/geocoding_platform_interface.dart';

import '../screens/weather/components/choose_city.dart';

class LocationSunny {
  late double latitude;
  late double longitude;
  String? cityName;
  String? countryName;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

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
      locationError = LocationError.yes;
      fetchingWeather = Fetching.no;
      modalHeightPercentage = 0.38;

      print('Sunny: Location Error - getCoordinates() - $e');
    }
  }
}
