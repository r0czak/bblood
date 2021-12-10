import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage storage = FirebaseStorage.instance;

  final Reference _locationImagesReference =
      FirebaseStorage.instance.ref('locations');

  final Reference _newsImagesReference = FirebaseStorage.instance.ref('news');

  Future getLocationImageURL(String image) async {
    String downloadUrl =
        await _locationImagesReference.child(image).getDownloadURL();

    return downloadUrl;
  }

  Future<String> getNewsImageURL(String image) async {
    String downloadUrl =
        await _newsImagesReference.child(image).getDownloadURL();

    return downloadUrl;
  }
}
