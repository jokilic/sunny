import '../../../colors.dart';
import '../../../strings.dart';

String getCondition(weatherCondition) {
  switch (weatherCondition) {
    case 'clearsky_day':
      currentColor = dayColor;
      return clearsky_day;
    case 'clearsky_night':
      currentColor = nightColor;
      return clearsky_night;
    case 'fair_day':
      currentColor = fairDayColor;
      return fair_day;
    case 'fair_night':
      currentColor = fairNightColor;
      return fair_night;
    case 'heavyrainshowers_day':
      currentColor = heavyRainColor;
      return heavyrainshowers_day;
    case 'heavyrainshowers_night':
      currentColor = heavyRainColor;
      return heavyrainshowers_night;
    case 'heavyrainshowersandthunder_day':
      currentColor = heavyRainColor;
      return heavyrainshowersandthunder_day;
    case 'heavyrainshowersandthunder_night':
      currentColor = heavyRainColor;
      return heavyrainshowersandthunder_night;
    case 'heavysleetshowers_day':
      currentColor = sleetColor;
      return heavysleetshowers_day;
    case 'heavysleetshowers_night':
      currentColor = sleetColor;
      return heavysleetshowers_night;
    case 'heavysleetshowersandthunder_day':
      currentColor = sleetColor;
      return heavysleetshowersandthunder_day;
    case 'heavysleetshowersandthunder_night':
      currentColor = sleetColor;
      return heavysleetshowersandthunder_night;
    case 'heavysnowshowers_day':
      currentColor = snowColor;
      return heavysnowshowers_day;
    case 'heavysnowshowers_night':
      currentColor = snowColor;
      return heavysnowshowers_night;
    case 'heavysnowshowersandthunder_day':
      currentColor = snowColor;
      return heavysnowshowersandthunder_day;
    case 'heavysnowshowersandthunder_night':
      currentColor = snowColor;
      return heavysnowshowersandthunder_night;
    case 'lightrainshowers_day':
      currentColor = lightRainColor;
      return lightrainshowers_day;
    case 'lightrainshowers_night':
      currentColor = lightRainColor;
      return lightrainshowers_night;
    case 'lightrainshowersandthunder_day':
      currentColor = lightRainColor;
      return lightrainshowersandthunder_day;
    case 'lightrainshowersandthunder_night':
      currentColor = lightRainColor;
      return lightrainshowersandthunder_night;
    case 'lightsleetshowers_day':
      currentColor = sleetColor;
      return lightsleetshowers_day;
    case 'lightsleetshowers_night':
      currentColor = sleetColor;
      return lightsleetshowers_night;
    case 'lightsnowshowers_day':
      currentColor = lightSnowColor;
      return lightsnowshowers_day;
    case 'lightsnowshowers_night':
      currentColor = lightSnowColor;
      return lightsnowshowers_night;
    case 'lightssleetshowersandthunder_day':
      currentColor = sleetColor;
      return lightssleetshowersandthunder_day;
    case 'lightssleetshowersandthunder_night':
      currentColor = sleetColor;
      return lightssleetshowersandthunder_night;
    case 'lightssnowshowersandthunder_day':
      currentColor = lightSnowColor;
      return lightssnowshowersandthunder_day;
    case 'lightssnowshowersandthunder_night':
      currentColor = lightSnowColor;
      return lightssnowshowersandthunder_night;
    case 'partlycloudy_day':
      currentColor = cloudyColor;
      return partlycloudy_day;
    case 'partlycloudy_night':
      currentColor = cloudyColor;
      return partlycloudy_night;
    case 'rainshowers_day':
      currentColor = rainColor;
      return rainshowers_day;
    case 'rainshowers_night':
      currentColor = rainColor;
      return rainshowers_night;
    case 'rainshowersandthunder_day':
      currentColor = rainColor;
      return rainshowersandthunder_day;
    case 'rainshowersandthunder_night':
      currentColor = rainColor;
      return rainshowersandthunder_night;
    case 'sleetshowers_day':
      currentColor = sleetColor;
      return sleetshowers_day;
    case 'sleetshowers_night':
      currentColor = sleetColor;
      return sleetshowers_night;
    case 'sleetshowersandthunder_day':
      currentColor = sleetColor;
      return sleetshowersandthunder_day;
    case 'sleetshowersandthunder_night':
      currentColor = sleetColor;
      return sleetshowersandthunder_night;
    case 'snowshowers_day':
      currentColor = snowColor;
      return snowshowers_day;
    case 'snowshowers_night':
      currentColor = snowColor;
      return snowshowers_night;
    case 'snowshowersandthunder_day':
      currentColor = snowColor;
      return snowshowersandthunder_day;
    case 'snowshowersandthunder_night':
      currentColor = snowColor;
      return snowshowersandthunder_night;
    case 'cloudy':
      currentColor = cloudyColor;
      return cloudy;
    case 'fog':
      currentColor = fogColor;
      return fog;
    case 'heavyrain':
      currentColor = rainColor;
      return heavyrain;
    case 'heavyrainandthunder':
      currentColor = rainColor;
      return heavyrainandthunder;
    case 'heavysleet':
      currentColor = sleetColor;
      return heavysleet;
    case 'heavysleetandthunder':
      currentColor = sleetColor;
      return heavysleetandthunder;
    case 'heavysnow':
      currentColor = snowColor;
      return heavysnow;
    case 'heavysnowandthunder':
      currentColor = snowColor;
      return heavysnowandthunder;
    case 'lightrain':
      currentColor = lightRainColor;
      return lightrain;
    case 'lightrainandthunder':
      currentColor = lightRainColor;
      return lightrainandthunder;
    case 'lightsleet':
      currentColor = sleetColor;
      return lightsleet;
    case 'lightsleetandthunder':
      currentColor = sleetColor;
      return lightsleetandthunder;
    case 'lightsnow':
      currentColor = lightSnowColor;
      return lightsnow;
    case 'lightsnowandthunder':
      currentColor = lightSnowColor;
      return lightsnowandthunder;
    case 'rain':
      currentColor = rainColor;
      return rain;
    case 'rainandthunder':
      currentColor = rainColor;
      return rainandthunder;
    case 'sleet':
      currentColor = sleetColor;
      return sleet;
    case 'sleetandthunder':
      currentColor = sleetColor;
      return sleetandthunder;
    case 'snow':
      currentColor = snowColor;
      return snow;
    case 'snowandthunder':
      currentColor = snowColor;
      return snowandthunder;
    default:
      currentColor = backgroundColor;
      return noCondition;
  }
}

// Weather statuses
const String clearsky_day = 'Sunny';
const String clearsky_night = 'Starry night';

const String fair_day = 'Fair';
const String fair_night = 'Fair';

const String heavyrainshowers_day = 'Heavy rain showers';
const String heavyrainshowers_night = 'Heavy rain showers';

const String heavyrainshowersandthunder_day = 'Heavy rain showers and thunder';
const String heavyrainshowersandthunder_night =
    'Heavy rain showers and thunder';

const String heavysleetshowers_day = 'Heavy sleet showers';
const String heavysleetshowers_night = 'Heavy sleet showers';

const String heavysleetshowersandthunder_day =
    'Heavy sleet showers and thunder';
const String heavysleetshowersandthunder_night =
    'Heavy sleet showers and thunder';

const String heavysnowshowers_day = 'Heavy snow showers';
const String heavysnowshowers_night = 'Heavy snow showers';

const String heavysnowshowersandthunder_day = 'Heavy snow showers and thunder';
const String heavysnowshowersandthunder_night =
    'Heavy snow showers and thunder';

const String lightrainshowers_day = 'Light rain showers';
const String lightrainshowers_night = 'Light rain showers';

const String lightrainshowersandthunder_day = 'Light rain showers and thunder';
const String lightrainshowersandthunder_night =
    'Light rain showers and thunder';

const String lightsleetshowers_day = 'Light sleet showers';
const String lightsleetshowers_night = 'Light sleet showers';

const String lightsnowshowers_day = 'Light snow showers';
const String lightsnowshowers_night = 'Light snow showers';

const String lightssleetshowersandthunder_day =
    'Light sleet showers and thunder';
const String lightssleetshowersandthunder_night =
    'Light sleet showers and thunder';

const String lightssnowshowersandthunder_day = 'Light snow showers and thunder';
const String lightssnowshowersandthunder_night =
    'Light snow showers and thunder';

const String partlycloudy_day = 'Partly cloudy';
const String partlycloudy_night = 'Partly cloudy';

const String rainshowers_day = 'Rain showers';
const String rainshowers_night = 'Rain showers';

const String rainshowersandthunder_day = 'Rain showers and thunder';
const String rainshowersandthunder_night = 'Rain showers and thunder';

const String sleetshowers_day = 'Sleet showers';
const String sleetshowers_night = 'Sleet showers';

const String sleetshowersandthunder_day = 'Sleet showers and thunder';
const String sleetshowersandthunder_night = 'Sleet showers and thunder';

const String snowshowers_day = 'Snow showers';
const String snowshowers_night = 'Snow showers';

const String snowshowersandthunder_day = 'Snow showers and thunder';
const String snowshowersandthunder_night = 'Snow showers and thunder';

const String cloudy = 'Cloudy';
const String fog = 'Foggy';
const String heavyrain = 'Heavy rain';
const String heavyrainandthunder = 'Heavy rain and thunder';
const String heavysleet = 'Heavy sleet';
const String heavysleetandthunder = 'Heavy sleet and thunder';
const String heavysnow = 'Heavy snow';
const String heavysnowandthunder = 'Heavy snow and thunder';
const String lightrain = 'Light rain';
const String lightrainandthunder = 'Light rain and thunder';
const String lightsleet = 'Light sleet';
const String lightsleetandthunder = 'Light sleet and thunder';
const String lightsnow = 'Light snow';
const String lightsnowandthunder = 'Light snow and thunder';
const String rain = 'Rain';
const String rainandthunder = 'Rain and thunder';
const String sleet = 'Sleet';
const String sleetandthunder = 'Sleet and thunder';
const String snow = 'Snow';
const String snowandthunder = 'Snow and thunder';
