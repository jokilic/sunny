import 'location.dart';
import 'network.dart';
import '../strings.dart';

class Weather {
  LocationSunny location = LocationSunny();

  Future<dynamic> getLocationWeather() async {
    await location.getLocation();

    Network network = Network(
        '$weatherApi?lat=${location.latitude}&lon=${location.longitude}');

    var weatherData = await network.getData();
    return weatherData;
  }

  Future<List<String>> getLocationName() async {
    await location.getLocation();

    List<String> locationName = [];
    locationName.add(location.cityName);
    locationName.add(location.countryName);

    return locationName;
  }

  Future<dynamic> getLocationTimezone() async {
    await location.getLocation();

    Network network = Network(
        '$timeZoneDbApiRoot?key=$timeZoneDbApiKey&format=json&by=position&lat=${location.latitude}&lng=${location.longitude}');

    var timezoneData = await network.getData();
    return timezoneData;
  }

  Future<dynamic> getCustomWeather(chosenCity) async {
    await location.getCoordinates(chosenCity);

    Network network = Network(
        '$weatherApi?lat=${location.latitude}&lon=${location.longitude}');

    var weatherData = await network.getData();
    return weatherData;
  }

  Future<List<String>> getCustomName(chosenCity) async {
    await location.getCoordinates(chosenCity);

    List<String> locationName = [];
    locationName.add(location.cityName);
    locationName.add(location.countryName);

    return locationName;
  }

  Future<dynamic> getCustomTimezone(chosenCity) async {
    await location.getCoordinates(chosenCity);

    Network network = Network(
        '$timeZoneDbApiRoot?key=$timeZoneDbApiKey&format=json&by=position&lat=${location.latitude}&lng=${location.longitude}');

    var timezoneData = await network.getData();
    return timezoneData;
  }
}
