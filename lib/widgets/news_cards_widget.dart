import 'package:bblood/models/blood_levels_model.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCardsWidget extends StatelessWidget {

  Widget buildCard(String image, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    image),
                    fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          ExpansionTileCard(
            baseColor: Color(0xFFDA4148),
            title: Text(title, style: TextStyle(fontSize: 14)),
            children: <Widget>[
              const Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                     description
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column (
        children: [
          buildCard('images/gadgets.png', 'Akcja busa na kampusie Politechniki', 'opis akcji'),
          buildCard('images/gadgets.png', 'title', 'opis akcji'),
        ],
      ),
    );
  }
}