import 'dart:convert';

import 'package:flutter/material.dart';

class AuthService{
  static final AuthService _authService = AuthService._internal();

  static AuthService get() {
    return _authService;
  }

  AuthService._internal();

  Future<dynamic> getCredentials(BuildContext context) async{
    try{
      String credentialString = await DefaultAssetBundle.of(context).loadString("assets/credential.json",cache: true);
      return jsonDecode(credentialString);
    }catch (e){
      debugPrint(e.toString());
    }
  }
}