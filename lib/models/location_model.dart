import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationService {
  String _place;
  double _lat;
  double _lng;
  String _placeName;
  String _description;
  String _info;
  String _logo;
  String _markerId;
/*
  LocationService(String place, double lat, double lng, String placeName, String description, String info, String markerId){
    this.place = place;
    this.lat = lat;
    this.lng = lng;
    this.placeName = placeName;
    this.description = description;
  }
*/

  LocationService(this._place, this._lat, this._lng, this._placeName,
      this._description, this._info, this._logo, this._markerId);


  void getLocation(){
      return null;
  }

  String get place => _place;

  double get lat => _lat;

  double get lng => _lng;

  String get placeName => _placeName;

  String get description => _description;

  String get info => _info;

  String get logo => _logo;

  String get markerId => _markerId;
}