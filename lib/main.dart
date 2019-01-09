import 'package:flutter/material.dart';
import 'package:try_app/pages/splash_screen.dart';
import 'package:try_app/pages/login.dart';

var routes = <String, WidgetBuilder>{
  "/intro": (BuildContext context) => Login(),
};

void main() => runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));

































// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:try_app/login.dart';

// void main() => runApp(MaterialApp(

//     theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
//     debugShowCheckedModeBanner: false,
//     home: SplashScreen(),
// ));

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {

//   @override
//     void initState() {
//       // TODO: implement initState
//       super.initState();
//       Timer(Duration(seconds: 5),()=> Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MyApp()),),
//       );
//     }


//   @override
//   Widget build(BuildContext context){
//     return new Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Container(decoration: BoxDecoration(color: Colors.redAccent),),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   child: Column(mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[CircleAvatar( radius: 100.00,
//                         child: Image.asset("assets/bus.png",),
//                       ),
//                       Text("Hyper Analytics", style: TextStyle(color: Colors.white, fontSize: 24.00, fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(flex: 1,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   CircularProgressIndicator(),
//                   Padding(padding: EdgeInsets.only(top: 20.00),
//                   ),
//                   Text("Loading...",
//                   style: TextStyle(color: Colors.white, fontSize: 12.00, fontWeight: FontWeight.bold,)
//                   ),
//                 ],
//               ),)
//           ],)
//         ],
//       ),
//     );
//   }
// }