import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  _NewsCarouselState createState() => new _NewsCarouselState();
}

class _NewsCarouselState extends State<News> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 18.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {

    Widget carousel = new Carousel(
      boxFit: BoxFit.cover,
      images: [
        new AssetImage('assets/images/1.jpg'),
        new AssetImage('assets/images/2.jpg'),
        new AssetImage('assets/images/3.jpg'),
        new AssetImage('assets/images/4.jpg'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(seconds: 1),
    );
    return new Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      backgroundColor: Colors.white,
      body: new Center(
        child: new Container(
          child: new ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: new Stack(
              children: [
                carousel,
                // banner,
              ],
            ),
          ),
        ),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}