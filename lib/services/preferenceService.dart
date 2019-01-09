import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService{
  
  SharedPreferences prefs;
  bool didInit = false;
  
  static final PreferenceService _preferenceService = PreferenceService._internal();

  static PreferenceService get() {
    return _preferenceService;
  }

  PreferenceService._internal();

    Future<dynamic> getSignUp(BuildContext context) async{
    try{
      String credentialString = await DefaultAssetBundle.of(context).loadString("assets/credential.json",cache: true);
      return jsonDecode(credentialString);
    }catch (e){
      debugPrint(e.toString());
    }
  }
  
    Future<SharedPreferences> _getPrefs() async {
      if (!didInit) await _init();
      return prefs;
    }

    Future _init() async {
      prefs = await SharedPreferences.getInstance();
      didInit = true;
    }

    Future init() async {
      return await _init();
    }

    Future<String> getEmail () async {
      prefs = await _getPrefs();
      return prefs.getString("EMAIL");
    }

    Future<bool> setEmail(String email) async {
      prefs = await _getPrefs();
      return prefs.setString("EMAIL", email);
    }

    Future removeEmail() async {
      prefs = await _getPrefs();
      prefs.remove("EMAIL");
    }

    Future<String> getFullName () async {
      prefs = await _getPrefs();
      return prefs.getString("FULLNAME");
    }

    Future<bool> setFullname(String email) async {
      prefs = await _getPrefs();
      return prefs.setString("FULLNAME", email);
    }

    Future removeFullname() async {
      prefs = await _getPrefs();
      prefs.remove("FULLNAME");
    }

    Future<String> getPassword () async {
      prefs = await _getPrefs();
      return prefs.getString("PASSWORD");
    }

    Future<bool> setPassword(String email) async {
      prefs = await _getPrefs();
      return prefs.setString("PASSWORD", email);
    }

    Future removePassword() async {
      prefs = await _getPrefs();
      prefs.remove("PASSWORD");
    }
  
}