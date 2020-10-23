![Header](https://raw.githubusercontent.com/jokilic/sunny/master/screenshots/header.png)

# Sunny ☀️

☀️ **Sunny** is a simple app made in Flutter. 👨‍💻

* It shows multiple weather types
   * Current weather 🌊
   * Hourly weather 🍃
   * Daily weather 🌪️
* It offers the user to enter any desired city manually 🌎
* It uses yr.no as the weather provider 🇳🇴

The Norwegian Meteorological Institute was kind enough to offer the weather data for free.
Without it, this app wouldn't be possible.

### Sunny can be downloaded from [HERE](https://play.google.com/store/apps/details?id=com.josipkilic.sunny).

![Multi](https://raw.githubusercontent.com/jokilic/sunny/master/screenshots/multi.png)

## Things I still want to do:

- [ ] Create / download other weather icons
- [ ] Refactor code as much as you can
- [ ] Make the UI responsive as much as you can
- [x] Update scroll animations to use BouncingScrollPhysics
- [x] Make it impossible to go back to the LoadingScreen after the weather has been loaded
- [x] Build a production version of the app and publish on the Play store
- [x] Create screenshots for the Play store
- [x] Implement the **InfoScreen**
- [x] Make the **LoadingScreen** a bit nicer looking
- [x] Recreate weather icons that have stroke instead of fill
- [x] Test all weather variations and background colors
- [x] Create gradients for each weather condition
- [x] Implement some error handling when invalid city name is entered
- [x] Use Geolocator v6 & Geocoding plugins
- [x] Remove *height* and *width* tags from each SVG
- [x] Add an icon, splash screen, etc.
- [x] Add an indicator of waiting while waiting for weather via location
- [x] Add a GPS icon on the top left to check for weather via location
- [x] Remove small GPS icon above city name if the user has entered a custom city
- [x] Add an indicator of waiting while fetching the custom weather
- [x] Implement a modal view to enter a new city
- [x] Add Weekly forecast and a way to scroll between 'Today' and 'Week'
- [x] Implement some Timezone API in order to get the correct time from requested city
- [x] Create proper Classes instead of Lists 
- [x] Make a general icon for unknown weather, call it **noweather.svg**
- [x] Test on smaller devices, add scrolling functionality
- [x] Colors should change depending on the weather condition
- [x] Move condition variables to *conditions.dart*
- [x] Replace hardcoded text with variables
- [x] Create other weather icons from the downloaded ones
- [x] Rename icons to the required names (e.g. **clearsky_day**)
