import 'package:flutter/material.dart';
import 'package:try_app/pages/news.dart';

class ReceiptPage extends StatefulWidget {
  @override
  _ReceiptPageState createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      'TICKET NUMBER \n R134590Q5',
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              alignment: Alignment.center,
              child: Text("Payment has been successfully received!",
                  style:
                      TextStyle(fontSize: 20.00, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              alignment: Alignment.center,
              child: Text("Thank you for purchasing bus ticket from our applications! Do remember to claim your tickets at the selected counter 30 minutes before departure. You can go to Navigation Menu ≡ and Tap Purchase/History to view your receipt!",
                  style:
                      TextStyle(fontSize: 15.00),
                  textAlign: TextAlign.center),
            ),
            SizedBox(height: 130.0),
            Container(
                padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Column(children: <Widget>[
                  SizedBox(height: 10.0),
                  Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(00.0),
                        shadowColor: Colors.redAccent,
                        color: Colors.red,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () => Navigator.push(context,MaterialPageRoute(
                                  builder: (context) => News())),
                          child: Center(
                            child: Text(
                              'AUTO REDIRECT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 2.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(0.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Text('Go Back',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                      ),
                    ),
                  ),
                ])),
          ],
        ));
  }
}
