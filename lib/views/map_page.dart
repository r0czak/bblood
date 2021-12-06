import 'dart:async';

import 'package:bblood/models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  //final _formKey = GlobalKey<FormState>();
  Completer<GoogleMapController> _controller = Completer();

  static LocationService? _selectedLocation = null;
  static LocationService lodzRckik = LocationService(
      'Lodz, ul.Franciszkańska 17/25',
      51.78242385144876,
      19.461915438251182,
      'Regionalne centrum krwiodactwa i krwiolecznictwa w Lodzi',
      'Otwarte dni: pn-pt w godz. 8-16',
      'Rckik Lodz',
      'images/rckik.png',
      '_googlePlex');
  static LocationService warsawRckik = LocationService(
      'Warszawa, ul.Saska 64/75',
      52.23280551341,
      21.060469150491453,
      'Regionalne centrum krwiodactwa i krwiolecznictwa w Warszawie',
      'Otwarte dni: pn-sb w godzinach 7-16',
      'Rckik Warszawa',
      'images/rckik_logo_waw.png',
      '_googlePlex2');
  static LocationService cracovRckik = LocationService(
      'Krakow, ul.Rzeźnicza 11',
      50.05643819177071,
      19.95700047443339,
      'Regionalne centrum krwiodactwa i krwiolecznictwa w Krakowie',
      'Otwarte: brak danych',
      'Rckik Krakow',
      'images/rckik_logo_cracow.png',
      '_googlePlex3');
  final List<LocationService> items = <LocationService>[
    lodzRckik,
    warsawRckik,
    cracovRckik
  ];

  //final CameraPosition _position; = CameraPosition(target: LatLng(_selectedLocation!.lat, _selectedLocation!.lng), zoom: 15);
  //default camera position
  CameraPosition _position = CameraPosition(target: LatLng(0, 0), zoom: 15);

  @override
  void initState() {
    setState(() {
      if (_selectedLocation != null) {
        _position = CameraPosition(
            target: LatLng(_selectedLocation!.lat, _selectedLocation!.lng),
            zoom: 15);
      } else {
        _position = CameraPosition(
            target: LatLng(51.78242385144876, 19.461915438251182), zoom: 15);
      }
    });
  }

  //default map marker
  Marker _googlePlexMarker = const Marker(
    markerId: MarkerId('idMarker'),
    infoWindow: InfoWindow(title: ''),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(0, 0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEDEDED),
        body: Column(children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<LocationService>(
                      value: _selectedLocation,
                      isExpanded: true,
                      onChanged: (LocationService? value) {
                        //setState(() {
                        _selectedLocation = value;
                        _changeCameraPosition(value);
                        //});
                        //_changeCameraPosition(value);
                      },
                      items: items.map((LocationService location) {
                        return DropdownMenuItem<LocationService>(
                          value: location,
                          child: Text(
                            location.info,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 17),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              markers: {_googlePlexMarker},
              initialCameraPosition: _position,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ]));
  }

  Future<void> _changeCameraPosition(LocationService? location) async {
    final GoogleMapController controller = await _controller.future;

    final CameraPosition _kLake =
        CameraPosition(target: LatLng(location!.lat, location.lng), zoom: 16);

    setState(() {
      setMarker();
    });
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  void setMarker() {
    Marker _changedMarker = Marker(
      markerId: MarkerId(_selectedLocation!.markerId),
      //infoWindow: InfoWindow(title: _selectedLocation!.placeName),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(_selectedLocation!.lat, _selectedLocation!.lng),
      onTap: () {
        _donorPointInfoBox(context);
      },
    );
    _googlePlexMarker = _changedMarker;
  }

  void _donorPointInfoBox(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * .50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_selectedLocation!.logo),
                colorFilter: ColorFilter.mode(
                    Color(0xFFEDEDED).withOpacity(0.9), BlendMode.srcOver),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(children: <Widget>[
              SizedBox(
                width: 400,
                child: Image.asset(
                  "images/rckik.png",
                  //fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(_selectedLocation!.placeName,
                  style: TextStyle(fontSize: 22)),
              const SizedBox(
                height: 15,
              ),
              Row(children: [
                Text(_selectedLocation!.place, style: TextStyle(fontSize: 18)),
              ]),
              //Text(_selectedLocation!.place, style: TextStyle(fontSize: 15)),
              const SizedBox(height: 15),
              Row(children: [
                Text(_selectedLocation!.description,
                    style: TextStyle(fontSize: 18)),
              ]),
            ]),
          );
        });
  }
}
