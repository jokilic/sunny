import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../screens/weather/components/choose_city.dart';

class LocationSunny {
  double latitude;
  double longitude;
  String cityName;
  String countryName;

  Future<bool> requestLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  Future<void> getLocation() async {
    try {
      final permissionGranted = await requestLocationPermission();

      if (!permissionGranted) {
        return;
      }

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

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
