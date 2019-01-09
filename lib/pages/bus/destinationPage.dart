import 'package:flutter/material.dart';
import 'package:try_app/pages/bus/list_of_bus.dart';

class DestinationPage extends StatefulWidget {
  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {

  var _state = ['MELAKA','JOHOR BAHRU','NEGERI SEMBILAN','KUALA LUMPUR','PULAU PINANG','PERAK','PERLIS','TERENGGANU','PAHANG','KEDAH'];
  var _currentItemSelectedFrom = 'KUALA LUMPUR';
  var _currentItemSelectedTo = 'PERAK';


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, 
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    'BUS E-TICKETING',
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50.0),
          new Text("    FROM", style: TextStyle(fontSize: 20.00, fontWeight: FontWeight.bold)),
          Container(
              padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),

                  

                  DropdownButton<String>(
                    
                    isExpanded: true,
                    items: _state.map((String dropDownStringItem){
                      return DropdownMenuItem<String>(
                        
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),

                        );
                    }).toList(),

                    onChanged: (String newValueSelected) {
                      setState(() {
                        this._currentItemSelectedFrom = newValueSelected;

                      });
                    },

                    value: _currentItemSelectedFrom
                  ),

                ])),
                SizedBox(height: 30.0),
                new Text("    TO", style: TextStyle(fontSize: 20.00, fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                  DropdownButton<String>(
                    
                    isExpanded: true,
                    items: _state.map((String dropDownStringItem){
                      return DropdownMenuItem<String>(
                        
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),

                        );
                    }).toList(),

                    onChanged: (String newValueSelected) {
                      setState(() {
                        this._currentItemSelectedTo = newValueSelected;

                      });
                    },

                    value: _currentItemSelectedTo
                  ),

                

                  SizedBox(height: 20.0),
                  Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(00.0),
                        shadowColor: Colors.redAccent,
                        color: Colors.red,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => ListOfBus())),
                          child: Center(
                            child: Text(
                              'CONFIRM',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 20.0),

                ])),
                  // Container(
                  //   height: 40.0,
                  //   color: Colors.transparent,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         border: Border.all(
                  //             color: Colors.black,
                  //             style: BorderStyle.solid,
                  //             width: 1.0),
                  //         color: Colors.transparent,
                  //         borderRadius: BorderRadius.circular(0.0)),
                  //     child: InkWell(
                  //       onTap: () {
                  //         Navigator.of(context).pop();
                  //       },
                  //       child:
                  //           Center(
                  //             child: Text('Go Back',
                  //                 style: TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                     fontFamily: 'Montserrat')),
                  //           ),
                  //     ),
                  //   ),
                  // ),
                ],
              
        ));    
  }
}