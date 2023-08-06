import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_tracker/geoLocation.dart';
import 'package:weather_tracker/weatherData.dart';
import 'package:weather_tracker/weatherModel.dart';
import 'package:weather_tracker/auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  // final User? user = Auth().currentUser;
  
  // Future<void> signOut() async {{
  //   await Auth().signOut();
  // }}

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var client = WeatherData();
  late Future<Weather?> data;

  // ignore: body_might_complete_normally_nullable
  Future<Weather?> updateData() async {
    var position = await GetPosition();
    setState(() {
      data = client.getData(position.latitude, position.longitude);
    });
  }

  @override
  void initState() {
    super.initState();
    data = updateData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var dateFormat = DateFormat('EEEE, d MMM, yyyy').format(DateTime.now());
   return Scaffold(
      body: FutureBuilder<Weather?>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          }

          var weatherData = snapshot.data!;

        return Container(
        child: Column(
          children: [
            Container(
              height: size.height *0.7,
              width: size.width,
              padding: EdgeInsets.only(top: 15),
              margin: EdgeInsets.only(right: 10,left: 10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(40),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff955cd1),
                    Color(0xff3fa2fa),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.2,0.85],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    '${weatherData.cityName}',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 25),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    dateFormat,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14),
                  ),
                  Image.asset(
                    'assets/img/partlyCloudy.png',
                    width: size.width * 0.4,
                    ),
                  // Image.asset(
                  //   '${data?.icon}',
                  //   width: size.width * 0.36),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                    '${weatherData.condition}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      ),
                  ),
                  SizedBox(
                      height: 2,
                    ),
                  Text(
                    '${weatherData.temp}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      //w600 and w700 how thick the word is
                      fontWeight: FontWeight.w700,
                      ),
                  ),
                  SizedBox(height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child:
                          Column(children: [
                            Image.asset(
                              'assets/img/strongWind.png',
                              width: size.width * 0.15,
                            ),
                            Text(
                              '${weatherData.wind}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Wind',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child:
                          Column(children: [
                            Image.asset(
                              'assets/img/rain.png',
                              width: size.width * 0.15,
                            ),
                            Text(
                              '${weatherData.humidity}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Humidity',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child:
                          Column(children: [
                            Image.asset(
                              'assets/img/sunny.png',
                              width: size.width * 0.15,
                            ),
                            Text(
                              '${weatherData.feels_like}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Feels Like',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          Row(
            children: [
              Expanded(
                child: Column(
                children: [
                  SizedBox(
                    height: 10),
                  Text(
                    'Gust', 
                    style: 
                    TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 17,),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                    '${weatherData.gust} kp/h', 
                    style: 
                    TextStyle(
                      color: Colors.white,
                      fontSize: 17,),
                    ),
                    Text(
                    'Pressure', 
                    style: 
                    TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 17,),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                    '${weatherData.pressure} hpa', 
                    style: 
                    TextStyle(
                      color: Colors.white,
                      fontSize: 17,),
                    ),
                  ],
                ),
              
              ),
              Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 10),
                  Text(
                    'UV', 
                    style: 
                    TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 17,),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                    '${weatherData.uv}', 
                    style: 
                    TextStyle(
                      color: Colors.white,
                      fontSize: 17,),
                    ),
                    Text(
                    'Precipitation', 
                    style: 
                    TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 17,),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                    '${weatherData.precipi} mm', 
                    style: 
                    TextStyle(
                      color: Colors.white,
                      fontSize: 17,),
                    ),
                  ],
                ),
              ),
              Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 10),
                  Text(
                    'Wind', 
                    style: 
                    TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 17,),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                    '${weatherData.wind} km/h', 
                    style: 
                    TextStyle(
                      color: Colors.white,
                      fontSize: 17,),
                    ),
                    Text(
                    'Last Updated', 
                    style: 
                    TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 17,),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                    '${weatherData.last_update}', 
                    style: 
                    TextStyle(
                      color: Colors.green,
                      fontSize: 13,),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ],
        ),
      );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updateData();
        },
        child: Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
      
  }
}