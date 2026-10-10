import 'package:flutter/material.dart';

class ForecastItem extends StatelessWidget {
  String hour;
  String asset;
  String temp;

  ForecastItem({
    super.key,
    required this.hour,
    required this.asset,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 16, bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xff3A3F42),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.blue, offset: Offset(5, 5), blurRadius: 8),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(hour, style: TextStyle(color: Colors.grey, fontSize: 14)),
          Image.asset("assets/icons/$asset.png", height: 50),
          Text("$temp°C", style: TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }
}
