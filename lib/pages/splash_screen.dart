import 'dart:async';

import 'package:flutter/material.dart';
import 'package:try_app/utils/my_navigator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
    void initState() {
      super.initState();
      Timer(Duration(seconds: 5),() => MyNavigator.goToIntro(context),
      );
    }


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(decoration: BoxDecoration(color: Colors.redAccent),),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[CircleAvatar( radius: 100.00,
                        child: Image.asset("assets/bus.png",),
                      ),
                      new Padding(padding: EdgeInsets.only(top: 20.00)),
                      Text("BUS E-TICKETING", style: TextStyle(color: Colors.white, fontSize: 24.00, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Expanded(flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(padding: EdgeInsets.only(top: 20.00),
                  ),
                  Text("Loading...",
                  style: TextStyle(color: Colors.white, fontSize: 12.00, fontWeight: FontWeight.bold,)
                  ),
                ],
              ),)
          ],)
        ],
      ),
    );
  }
}