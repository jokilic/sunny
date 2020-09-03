const String appName = 'Sunny';

// Yr.no API
const String weatherApi =
    'https://api.met.no/weatherapi/locationforecast/2.0/compact';
// TimeZoneDB API
const String timeZoneDbApiRoot = 'http://api.timezonedb.com/v2.1/get-time-zone';
const String timeZoneDbApiKey = 'H7MPWBEEZJLH';

// Icons
const String conditionIconRootAddress = 'assets/icons/conditions/';
const String noConditionIcon = 'assets/icons/conditions/noweather.svg';
const String sunIcon = 'assets/icons/sun.svg';
const String gpsIcon = 'assets/icons/gps.svg';
const String searchIcon = 'assets/icons/search.svg';
const String menuIcon = 'assets/icons/menu.svg';

// Strings
const String yrNoFirstString = 'Powered by ';
const String yrNoSecondString = 'Yr.no';
const String waitString = 'Just a moment';
const String searchString = 'Some other city?';
const String searchTextFieldString = 'e.g. \'Zagreb, Croatia\'';
const String searchCityError =
    'Requested city not found :(\nSearch for something else.';

const String noCity = 'City unavailable';
const String noTime = 'Time unavailable';
const String noTemperature = 'x';
const String noCondition = 'Condition unavailable';
const String noForecastHour = 'Hour unavailable';

// Info section
const String aboutSunnyTitleString = 'About Sunny';
const String aboutSunnyFirstString = ' is a simple application for ';
const String aboutSunnySecondString = 'checking the weather';
const String aboutSunnyThirdString = '.\n';
const String aboutSunnyFourthString = 'It\'s made with ';
const String aboutSunnyFifthString = 'Flutter';
const String aboutSunnySixthString = '.';
const String aboutSunnySeventhString = '\n\nWant to learn more about ';
const String aboutSunnyEighthString = '?\nVisit Flutter\'s ';
const String aboutSunnyNinthString = 'official website';
const String aboutSunnyTenthString = ' and get started.';

const String weatherProviderTitleString = 'Weather provider';
const String weatherProviderFirstString = 'Weather is fetched from ';
const String weatherProviderSecondString = 'Yr.no';
const String weatherProviderThirdString = '.\n\nThe ';
const String weatherProviderFourthString = 'Norwegian Meteorological Institute';
const String weatherProviderFifthString =
    ' was kind enough to offer the weather data for free.\nWithout it, this app wouldn\'t be possible.';

const String whoTitleString = 'Who am I?';
const String whoFirstString = 'My name is ';
const String whoSecondString = 'Josip';
const String whoThirdString = ' and I come from ';
const String whoFourthString = 'Croatia';
const String whoFifthString = '.\n\n';
const String whoSixthString =
    'I love creating mobile applications and I love development in general.\nI have decided to create Sunny in order to practice my programming skills.';
const String whoSeventhString =
    'I know there are millions of weather apps out there, but I wanted to create one in order to practice asynchronous programming, draw some vector icons and to work more with Flutter.';

const String aboutMeTitleString = 'Više o meni';
const String aboutMeWebsiteString = 'josipkilic.com';
const String aboutMeGitHubString = 'GitHub';
const String aboutMeEmailString = 'E-Mail';

const String thanksString = 'Thank you for using Sunny.';

// Links
const String flutterWebsite = 'https://flutter.dev';
const String yrNoWebsite = 'https://www.yr.no';
const String josipGithubWebsite = 'https://github.com/jokilic';
const String josipKilicWebsite = 'https://josipkilic.com';
const String josipKilicEmail = 'mailto:neksuses@gmail.com';

const String josipImage = 'assets/josip.jpg';

// Weather statuses (conditions.dart)
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
