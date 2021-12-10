class LocationsModel {
  String address;
  String full_name;
  String image;
  double lat;
  double long;
  String name;
  String open;
  String phone;
  String marker_id;

  LocationsModel(
      {required this.address,
      required this.full_name,
      required this.image,
      required this.lat,
      required this.long,
      required this.name,
      required this.open,
      required this.phone,
      required this.marker_id});

  factory LocationsModel.fromMap(map) {
    return LocationsModel(
        address: map['address'],
        full_name: map['full_name'],
        image: map['image'],
        lat: map['lat'],
        long: map['long'],
        name: map['name'],
        open: map['open'],
        phone: map['phone'],
        marker_id: map['marker_id']);
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'full_name': full_name,
      'image': image,
      'lat': lat,
      'long': long,
      'name': name,
      'open': open,
      'phone': phone,
      'marker_id': marker_id
    };
  }
}
