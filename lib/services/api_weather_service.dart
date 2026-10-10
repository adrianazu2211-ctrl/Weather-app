import 'package:http/http.dart' as http;

class ApiWeatherService {
  String urlBase = "https://api.weatherapi.com/v1/";

  Future<void> getWeatherInfo() async {
    final url = Uri.parse(
      "$urlBase/current.json?key=b0044802c4b0409897b21050261010&q=London&aqi=no",
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print("""Weather api response
        response: $response
        statuscode: ${response.statusCode}
        body: ${response.body}""");
      }
    } catch (e) {
      throw Exception("Error inesperado: $e");
    }
  }

  Future<void> getWeatherInfoByName(String ciudad) async {
    final url = Uri.parse(
      "$urlBase/current.json?key=b0044802c4b0409897b21050261010&q=$ciudad&aqi=no",
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print("""Weather api response
        response: $response
        statuscode: ${response.statusCode}
        body: ${response.body}""");
      }
    } catch (e) {
      throw Exception("Error inesperado: $e");
    }
  }
}
