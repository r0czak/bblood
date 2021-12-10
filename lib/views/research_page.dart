import 'dart:async';
import 'dart:io';

import 'package:bblood/widgets/photo_gallery_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ResearchScreen extends StatefulWidget {
  const ResearchScreen({Key? key}) : super(key: key);

  @override
  _ResearchScreenState createState() => _ResearchScreenState();
}

class _ResearchScreenState extends State<ResearchScreen> {
  File? image;

  Future pickPhoto(ImageSource source) async {
    final photo = await ImagePicker().pickImage(source: source);
    if (photo == null) return;

    final photoTemporary = File(photo.path);
    setState(() {
      this.image = photoTemporary;
    });
    Fluttertoast.showToast(
      msg: "Zapisano nowe zdjęcie badań",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }

  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          minimumSize: Size.fromHeight(50),
          primary: Color(0xFFDA4148),
          onPrimary: Colors.white,
          textStyle: TextStyle(fontSize: 18),
        ),
        child: Row(
          children: [
            Icon(icon, size: 28),
            const SizedBox(width: 16),
            Text(title),
          ],
        ),
        onPressed: onClicked,
      );

  List<ImageDetails> _images = [
    ImageDetails(
      imagePath: 'images/research_card2.png',
      researchDate: '22.10.2021',
      title: 'Badanie krwi',
      details: 'Wynik badań prawidłowy, brak przeciwskazań',
    ),
    ImageDetails(
      imagePath: 'images/resaerch_card.png',
      researchDate: '20.11.2021',
      title: 'Badanie krwi',
      details: 'Wynik badań prawidłowy, brak przeciwskazań',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              const Text(
                'Badania krwi',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFDA4148),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Lista badań',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                    ),
                    itemBuilder: (context, index) {
                      return RawMaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhotoViewWidget(
                                imagePath: _images[index].imagePath,
                                title: _images[index].title,
                                researchDate: _images[index].researchDate,
                                details: _images[index].details,
                                index: index,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          //tag: 'logo$index',
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage(_images[index].imagePath),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: _images.length,
                  ),
                ),
              ),
              buildButton(
                  title: "Zrób zdjęcie badań",
                  icon: Icons.camera_alt_outlined,
                  onClicked: () {
                    pickPhoto(ImageSource.camera);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageDetails {
  final String imagePath;
  final String researchDate;
  final String title;
  final String details;

  ImageDetails({
    required this.imagePath,
    required this.researchDate,
    required this.title,
    required this.details,
  });
}
