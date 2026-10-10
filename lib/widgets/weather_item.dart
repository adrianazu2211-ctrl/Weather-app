import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  String asset;
  WeatherItem({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/icons/$asset.png", height: 50),
        Text("18 km/h", style: TextStyle(color: Colors.white, fontSize: 18)),
      ],
    );
  }
}
