import 'dart:async';

import 'package:flutter/material.dart';
import 'package:try_app/services/authService.dart';
import 'package:try_app/pages/intro_screen.dart';
import 'package:try_app/pages/signup.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BUS E-TICKETING',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        '/signup': (BuildContext context) => new SignupPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loggingIn = false;
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _buildForm(),
    );
  }

  String validateEmail(String value) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  Widget _buildForm() {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[CircleAvatar( radius: 80.00,
                        child: Image.asset("assets/bus.png",),
                      ),
                  SizedBox(
                    height: 50.0,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) =>
                        value.isEmpty ? "Email Required" : null,
                    style: TextStyle(color: Colors.red),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email",
                      labelText: "Email",
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) =>
                        value.isEmpty ? "Password Required" : null,
                    obscureText: _hidePassword,
                    style: TextStyle(color: Colors.red),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Password",
                      labelText: "Password",
                      suffixIcon: IconButton(
                          icon: Icon(_hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox( height: 50.00),
                      Text('New to Bus E-Ticketing ? '),
                      InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: Text('Register Now',
                    style: TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.underline
                    ),),),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () => _validateAndLogin(),
                    splashColor: Colors.blue,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        _loggingIn ? CircularProgressIndicator() : Container(),
      ],
    );
  }

  void _validateAndLogin() {
    if (_formKey.currentState.validate()) {
      AuthService.get().getCredentials(context).then((credentials) {
        if (credentials != null) {
          for (int index = 0; index < credentials.length; index++) {
            if (_emailController.text == credentials[index]['email'] &&
                _passwordController.text == credentials[index]['password']) {
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text("Login Successful"),
                backgroundColor: Colors.green,
              ));
              Timer(
                Duration(seconds: 1),
                () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => IntroScreen()),
                    ),
              );
              break;// run now
            }
          }
          _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text("Email or Password Incorrect"),
                backgroundColor: Colors.red,
          ));
        }
      });
    }
  }
}
