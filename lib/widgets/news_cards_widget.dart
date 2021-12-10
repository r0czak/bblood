import 'package:bblood/models/news_info_model.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../locator.dart';
import '../services/firebase_storage_service.dart';

class NewsCardsWidget extends StatelessWidget {
  List<NewsInfoModel> news;
  final _firebaseStorageService = locator<FirebaseStorageService>();

  NewsCardsWidget(this.news);

  Widget buildCard(String url, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
              height: 150,
              child: FutureBuilder<String>(
                future: _firebaseStorageService.getNewsImageURL(url),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data == null) {
                      return Container();
                    } else {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data!),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
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
                  child: Text(description),
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
      child: Column(
        children: [
          for (int i = 0; i < news.length; i++)
            buildCard(news[i].image, news[i].title, news[i].description),
        ],
      ),
    );
  }
}
