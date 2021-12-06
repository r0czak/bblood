import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HonoryCardScreen extends StatefulWidget {
  const HonoryCardScreen({Key? key}) : super(key: key);

  @override
  _HonoryCardScreenState createState() => _HonoryCardScreenState();
}

class _HonoryCardScreenState extends State<HonoryCardScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFDA4148),
      backgroundColor: const Color(0xFFEDEDED),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Honorowy dawca"),
        backgroundColor: Color(0xFFDA4148),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 35.0,
                ),
              )),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            height: 700,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/blood_logo_2reg.png'),
                colorFilter: ColorFilter.mode(
                    Color(0xFFEDEDED).withOpacity(0.8), BlendMode.srcOver),
                fit: BoxFit.contain,
              ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      CircleAvatar(
                        radius: 70, //we give the image a radius of 50
                        backgroundImage: NetworkImage(
                            'https://webstockreview.net/images/male-clipart-professional-man-3.jpg'),
                      ),
                      Text(
                        "Jan Kowalski",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text("Legitymacja zasłużonego dawcy krwi",
                      style: TextStyle(color: Color(0xFFDA4148), fontSize: 20)),
                  SizedBox(height: 20),
                  Text("- Data urodzenia -"),
                  Text("  14-05-1997", style: TextStyle(fontSize: 17)),
                  SizedBox(height: 10),
                  Text("- Miejsce urodzenia -"),
                  Text("  Lodz", style: TextStyle(fontSize: 17)),
                  SizedBox(height: 10),
                  Text("- Grupa krwi -"),
                  Text("  A Rh+",
                      style: TextStyle(color: Color(0xFFDA4148), fontSize: 25)),
                  SizedBox(height: 20),
                  Text("- Zarejestrowany w -"),
                  Text(
                      "Regionalne centrum krwiodactwa i krwiolecznictwa w Lodzi",
                      style: TextStyle(color: Color(0xFFDA4148), fontSize: 20)),
                  SizedBox(height: 50),
                  SizedBox(
                      height: 130,
                      child: Image.asset(
                        "images/qr_code.png",
                        fit: BoxFit.contain,
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
