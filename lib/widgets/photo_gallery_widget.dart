import 'package:flutter/material.dart';

class PhotoViewWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String researchDate;
  final String details;
  final int index;

  PhotoViewWidget(
      {required this.imagePath,
        required this.title,
        required this.researchDate,
        required this.details,
        required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          researchDate,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text(details,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          padding: EdgeInsets.all(15),
                          color: Colors.red,
                          child: Text('Back',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}