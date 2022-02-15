import 'package:http/http.dart' as http;

 class WeatherDataProvider {

  final String API_KEY = "817bfff03c584be09809cfd80c8428e1";
    
  Future<http.Response> getRawWeatherData(String city) async {
   http.Response rawWeatherData = await http.get(
    Uri.parse( 
     "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$API_KEY&units=metric"
    ),
   );
   return rawWeatherData;
  }
   
 }

 //https://api.openweathermap.org/data/2.5/weather?q=merida&appid=817bfff03c584be09809cfd80c8428e1&units=metric