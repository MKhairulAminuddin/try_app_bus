import 'package:try_app/utils/intro.dart';
import 'package:flutter/material.dart';
import 'package:try_app/pages/home_screen.dart';
import 'package:try_app/widgets/introsetup.dart';

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEEEEE),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: PageView(
              children: <Widget>[
                IntroSetup(
                  title: HyperAnalytics.wt1,
                  content: HyperAnalytics.wc1,
                  imageIcon: Icons.mobile_screen_share,
                ),
                IntroSetup(
                  title: HyperAnalytics.wt2,
                  content: HyperAnalytics.wc2,
                  imageIcon: Icons.search,
                ),
                IntroSetup(
                  title: HyperAnalytics.wt3,
                  content: HyperAnalytics.wc3,
                  imageIcon: Icons.shopping_cart,
                ),
                IntroSetup(
                  title: HyperAnalytics.wt4,
                  content: HyperAnalytics.wc4,
                  imageIcon: Icons.verified_user,
                ),
              ],
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(lastPage ? "" : HyperAnalytics.skip,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () =>
                      lastPage ? null : Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage())),
                ),
                FlatButton(
                  child: Text(lastPage ? HyperAnalytics.gotIt : HyperAnalytics.next,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()))
                      : controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
