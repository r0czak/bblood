import 'dart:async';

import 'package:bblood/enums/view_state.dart';
import 'package:bblood/models/locations_model.dart';
import 'package:bblood/viewmodels/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  //final _formKey = GlobalKey<FormState>();
  Completer<GoogleMapController> _controller = Completer();

  late List<LocationsModel> locations;

  LocationsModel? _selectedLocation;

  //final CameraPosition _position; = CameraPosition(target: LatLng(_selectedLocation!.lat, _selectedLocation!.lng), zoom: 15);
  //default camera position
  CameraPosition _position = CameraPosition(target: LatLng(0, 0), zoom: 15);

  @override
  void initState() {
    setState(() {
      if (_selectedLocation != null) {
        _position = CameraPosition(
            target: LatLng(_selectedLocation!.lat, _selectedLocation!.long),
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
    return ViewModelBuilder<MapViewModel>.reactive(
        viewModelBuilder: () => MapViewModel(),
        onModelReady: (model) async {
          await model.readLocations();
          locations = model.getLocations();
        },
        builder: (context, model, child) => Scaffold(
            backgroundColor: const Color(0xFFEDEDED),
            body: Column(children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: model.state == ViewState.busy
                          ? const Center(child: CircularProgressIndicator())
                          : DropdownButtonHideUnderline(
                              child: DropdownButton<LocationsModel>(
                                isExpanded: true,
                                items: locations.map((LocationsModel location) {
                                  return DropdownMenuItem<LocationsModel>(
                                    value: location,
                                    child: Text(
                                      location.name,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (LocationsModel? value) {
                                  //setState(() {
                                  _selectedLocation = value;
                                  _changeCameraPosition(value);
                                  //});
                                  //_changeCameraPosition(value);
                                },
                                value: _selectedLocation,
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
            ])));
  }

  Future<void> _changeCameraPosition(LocationsModel? location) async {
    final GoogleMapController controller = await _controller.future;

    final CameraPosition _kLake =
        CameraPosition(target: LatLng(location!.lat, location.long), zoom: 16);

    setState(() {
      setMarker();
    });
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  void setMarker() {
    Marker _changedMarker = Marker(
      markerId: MarkerId(_selectedLocation!.marker_id),
      //infoWindow: InfoWindow(title: _selectedLocation!.placeName),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(_selectedLocation!.lat, _selectedLocation!.long),
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
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage(_selectedLocation!.logo),
            //     colorFilter: ColorFilter.mode(
            //         Color(0xFFEDEDED).withOpacity(0.9), BlendMode.srcOver),
            //     fit: BoxFit.fill,
            //   ),
            // ),
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
              Text(_selectedLocation!.full_name,
                  style: TextStyle(fontSize: 22)),
              const SizedBox(
                height: 15,
              ),
              Row(children: [
                Text(_selectedLocation!.address,
                    style: TextStyle(fontSize: 18)),
              ]),
              //Text(_selectedLocation!.place, style: TextStyle(fontSize: 15)),
              const SizedBox(height: 15),
              Row(children: [
                Text(_selectedLocation!.open, style: TextStyle(fontSize: 18)),
              ]),
            ]),
          );
        });
  }
}
