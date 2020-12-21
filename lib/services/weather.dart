import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apikey='a10f15eb78f5732d4c81f99ab1ae09be';
const openWeatherMapURL='https://api.openweathermap.org/data/2.5/weather';



class WeatherModel {
  Future<dynamic> getcityweather(String cityname) async{
    var url='$openWeatherMapURL?q=$cityname&appid=$apikey';
    Networkhelper networkhelper=Networkhelper(url);
    var weatherdata=await networkhelper.getdata();
    return weatherdata();
  }

  Future<dynamic> getlocationweather()async
  {
    Location location = Location();
    await location.getcurrentlocation();
    Networkhelper networkhelper = Networkhelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}'//if we have more than two string in $ we have to  put currly braces
            '&appid=$apikey');
    var weatherdata = await networkhelper.getdata();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
