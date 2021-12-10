import 'package:bblood/models/blood_levels_model.dart';
import 'package:bblood/models/news_info_model.dart';
import 'package:bblood/viewmodels/home_view_model.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCardsWidget extends StatelessWidget {
  List<NewsInfoModel> news;
  HomeViewModel model;

  NewsCardsWidget(this.news, this.model);

  Widget buildCard(String image, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // SizedBox(
          //   height: 150,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage(
          //           image),
          //           fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(
              height: 150,
              child: FutureBuilder<String>(
                future: model.getNewsImageURL(image),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data == null) {
                      return Container();
                    } else {
                      return Image.network(snapshot.data!,
                          fit: BoxFit.fitWidth);
                    }
                  } else {
                    return Container();
                  }
                },
              )),
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
          for (int i=0; i<news.length; i++)
            buildCard('images/gadgets.png', news[i].title, news[i].description),
        ],
      ),
    );
  }
}
