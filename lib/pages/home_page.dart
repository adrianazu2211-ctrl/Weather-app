import 'package:flutter/material.dart';
import 'package:weatherapp/services/api_weather_service.dart';
import 'package:weatherapp/widgets/forecast_item.dart';
import 'package:weatherapp/widgets/search_widget.dart';
import 'package:weatherapp/widgets/weather_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather app"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff2C2F31),
      ),
      backgroundColor: Color(0xff2C2F31),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ApiWeatherService apiWeatherService = ApiWeatherService();
          apiWeatherService.getWeatherInfo();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchWidget(
              controller: _cityController,
              function: () {
                ApiWeatherService apiWeatherService = ApiWeatherService();
                apiWeatherService.getWeatherInfoByName(_cityController.text);
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: [Color(0xff2E5FEC), Color(0xff6796F7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.2, 0.8],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Lima, Perú",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Image.asset("assets/icons/heavycloudy.png", height: 100),
                  Text(
                    "23.9 °",
                    style: TextStyle(fontSize: 100, color: Colors.white),
                  ),
                  Divider(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WeatherItem(asset: "windspeed"),
                      WeatherItem(asset: "humidity"),
                      WeatherItem(asset: "cloud"),
                    ],
                  ),
                ],
              ),
            ),

            // ---------- SECCIÓN FORECAST (nueva) ----------
            Text(
              "Forecast",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 16),
            // Una lista horizontal necesita una altura fija
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  ForecastItem(
                    hour: "01:00",
                    asset: "partlycloudy",
                    temp: "5.6",
                  ),
                  ForecastItem(
                    hour: "02:00",
                    asset: "partlycloudy",
                    temp: "5.9",
                  ),
                  ForecastItem(
                    hour: "03:00",
                    asset: "partlycloudy",
                    temp: "5.8",
                  ),
                  ForecastItem(
                    hour: "04:00",
                    asset: "partlycloudy",
                    temp: "5.5",
                  ),
                  ForecastItem(
                    hour: "05:00",
                    asset: "partlycloudy",
                    temp: "5.2",
                  ),
                  ForecastItem(
                    hour: "06:00",
                    asset: "partlycloudy",
                    temp: "5.0",
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
