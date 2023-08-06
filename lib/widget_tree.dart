// import 'package:weather_tracker/home_page.dart';
// import 'package:weather_tracker/auth.dart';
// import 'package:flutter/material.dart';
// import 'package:weather_tracker/login_page.dart';

// class WidgetTree extends StatefulWidget {
//   const WidgetTree({Key? key}) : super(key: key);

//   @override
//   State<WidgetTree> createState() => _WidgetTreeState();
// }

// class _WidgetTreeState extends State<WidgetTree> {
//   @override
//   Widget build(BuildContext context){
//     return StreamBuilder(
//       stream: Auth().authStateChanges,
//       builder: (context, snapshot){
//         if (snapshot.hasData){
//           return MyHomePage();
//         } else {
//           return const LoginPage();
//         }
//       },
//     );
//   }
// }