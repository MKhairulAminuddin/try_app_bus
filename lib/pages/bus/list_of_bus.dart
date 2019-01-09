import 'package:flutter/material.dart';
import 'package:try_app/pages/bus/seatpick.dart';

class ListOfBus extends StatefulWidget {
  @override
  _ListOfBusState createState() => _ListOfBusState();
}

class _ListOfBusState extends State<ListOfBus> {
  var _busList = [
    'TRANSNASIONAL',
    'MARALINER',
    'SANI EKSPRESS',
    'INTERCITY',
    'SRI MAJU',
    'TRANSISKANDAR',
  ];

  var _currentBusSelected = 'TRANSNASIONAL';

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
                      'BUS SELECTION',
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              alignment: Alignment.center,
              child: Text("ROUTE : \n KUALA LUMPUR -> PERAK",
                  style:
                      TextStyle(fontSize: 20.00, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
            SizedBox(height: 80.0),

            Container(
              alignment: Alignment.center,
              child: Text(" LIST OF BUS",
                style: TextStyle(fontSize: 20.00, fontWeight: FontWeight.bold)),
            ),
            Container(
                padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Column(children: <Widget>[
                  SizedBox(height: 10.0),
                  DropdownButton<String>(
                      isExpanded: true,
                      items: _busList.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem, textAlign: TextAlign.center),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this._currentBusSelected = newValueSelected;
                        });
                      },
                      value: _currentBusSelected),
                  SizedBox(height: 50.0),
                  Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(00.0),
                        shadowColor: Colors.redAccent,
                        color: Colors.red,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeatPick())),
                          child: Center(
                            child: Text(
                              'CHOOSE',
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
