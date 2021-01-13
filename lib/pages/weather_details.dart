import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherDetails extends StatelessWidget {
  final String city,temp,humidity;
  WeatherDetails({this.city,this.humidity,this.temp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111122),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 20,),
            Text('CITY',
            style: TextStyle(
              fontSize:30,
              letterSpacing: 2,
                color: Colors.white54
            ),),
            Spacer(flex: 1,),
            Text(city,
            style: TextStyle(
              fontSize: 35,
            ),),
            Spacer(flex: 8,),
            Text('TEMPERATURE',
            style: TextStyle(
              fontSize:30,
              letterSpacing: 2,
                color: Colors.white54
            ),),
            Spacer(flex: 1,),
            Text(temp,
              style: TextStyle(
                fontSize: 35,
              ),),
            Spacer(flex: 8,),
            Text('HUMIDITY',
            style: TextStyle(
              fontSize:30,
              letterSpacing: 2,
                color: Colors.white54
            ),),
            Spacer(flex: 1,),
            Text(humidity,
              style: TextStyle(
                fontSize: 35,
              ),),
            Spacer(flex: 20,),
          ],
        ),
      )
    );
  }
}
