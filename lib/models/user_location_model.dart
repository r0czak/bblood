class UserLocationModel {
  String? location_id;

  UserLocationModel({required this.location_id});

  factory UserLocationModel.fromMap(map) {
    return UserLocationModel(location_id: map['location_id']);
  }

  // send data to the server
  Map<String, dynamic> toMap() {
    return {'location_id': location_id};
  }
}
