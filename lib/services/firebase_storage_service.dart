import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage storage = FirebaseStorage.instance;

  final Reference _locationImagesReference =
      FirebaseStorage.instance.ref('locations');

  Future getLocationImageURL(String image) async {
    String downloadUrl =
        await _locationImagesReference.child(image).getDownloadURL();

    return downloadUrl;
  }
}
