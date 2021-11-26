import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BenefitsScreen extends StatefulWidget {
  const BenefitsScreen({Key? key}) : super(key: key);

  @override
  _BenefitsScreenState createState() => _BenefitsScreenState();
}

class _BenefitsScreenState extends State<BenefitsScreen> {
  final _formKey = GlobalKey<FormState>();

  Widget buildCard(String title, String description, String image){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            onTap: (){},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Ink.image(
                      height: 150,
                      image: AssetImage(
                        image
                      ),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("25.11.2021r.", style: TextStyle(fontSize: 12)),
                      SizedBox(height: 5),
                      Text(description, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                ButtonBar(
                  children: [
                    Text("nieaktywne", style: TextStyle(color: Color(0xFFDA4148))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: const Color(0xFFDA4148),
      backgroundColor: const Color(0xFFEDEDED),
      body: SingleChildScrollView(
          //child: Container(
                child: Column(
                    children: <Widget>[
                      buildCard('Apteka', 'Zniżki na leki dla dawców krwi', 'images/pharmacy.png'),
                      buildCard('Transport publiczny', 'Ulgi na przejazdy autobusami i koleją', 'images/transport.png'),
                      buildCard('RCKiK', 'Oddawaj krew i odbieraj gadżety, prezenty i gratisy dla krwiodawców', 'images/gadgets.png'),
                    ]
                ),
          //),
      ),
    );
  }
}