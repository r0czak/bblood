import 'package:bblood/enums/view_state.dart';
import 'package:bblood/viewmodels/home_view_model.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../widgets/blood_drops_state_widget.dart';
import '../widgets/news_cards_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) async {
        await model.readBloodLevels('rsf0xWMRrSdITScqa9DZ');
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: const Color(0xFFEDEDED),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          "images/panel1.png",
                          fit: BoxFit.contain,
                        )),
                    Text("Stany krwi", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                    SizedBox(),
                    Divider(color: Color(0xFFDA4148), thickness: 2),
                    Container(
                        color: Colors.white,
                        child: model.state == ViewState.busy
                            ? const Center(child: CircularProgressIndicator())
                            : BloodDropsStateWidget(model.getBloodLevels())),
                    NewsCardsWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
