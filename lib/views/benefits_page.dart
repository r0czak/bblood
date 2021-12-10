import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_dialog_widget.dart';

class BenefitsScreen extends StatefulWidget {
  const BenefitsScreen({Key? key}) : super(key: key);

  @override
  _BenefitsScreenState createState() => _BenefitsScreenState();
}

class _BenefitsScreenState extends State<BenefitsScreen> {
  final _formKey = GlobalKey<FormState>();

  Widget buildCard(String title, String description, String date, String image, int isActive){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            onTap: (){
              if (isActive == 1)
                showDialog(context: context, builder:(context) => CustomDialogWidget());
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Ink.image(
                      height: 150,
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(date, style: const TextStyle(fontSize: 12)),
                      const SizedBox(height: 5),
                      Text(description, style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                ButtonBar(
                  children: [
                    Text(isActive == 1 ? "aktywne" : "niekatywne", style: TextStyle(color: isActive == 1 ? Colors.green : Color(0xFFDA4148), fontSize: 15)),
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
      backgroundColor: const Color(0xFFEDEDED),
      body: SingleChildScrollView(
          //child: Container(
                child: Column(
                    children: <Widget>[
                        buildCard('Apteka', 'Zniżki na leki dla dawców krwi', '05.06.2021r. - 15.10.2021r.', 'images/pharmacy.png', 0),
                        buildCard('Transport publiczny', 'Ulgi na przejazdy autobusami i koleją', '11.09.2021r. - 11.09.2022r.', 'images/transport.png', 1),
                        buildCard('RCKiK', 'Oddawaj krew i odbieraj gadżety, prezenty i gratisy dla krwiodawców', '06.12.2021r. - 07.12.2021r.', 'images/gadgets.png', 0),
                    ]
                ),
          //),
      ),
    );
  }
}

