import 'location.dart';
import 'network.dart';
import '../strings.dart';

class Weather {
  Location location = Location();

  Future<dynamic> getLocationWeather() async {
    await location.getLocation();

    Network network = Network(
        '$weatherUrl?lat=${location.latitude}&lon=${location.longitude}');

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
}
