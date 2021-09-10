import 'package:bloc_pattern_best_code/model/news_model.dart';
import 'package:bloc_pattern_best_code/services/api_management.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel> _newsModel;

  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_newsModel == null) {
      return CircularProgressIndicator();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            child: FutureBuilder<NewsModel>(
              future: _newsModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount:
                          snapshot.data.data.relationships.related.length,
                      itemBuilder: (context, index) {
                        var article =
                            snapshot.data.data.relationships.related[index];
                        // var formattedTime = DateFormat('dd MMM - HH:mm')
                        //     .format(article.publishedAt);
                        return ListTile(
                          title: Text(article.data.id.toString()),
                        );
                      });
                } else
                  return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          SizedBox(height: 50),
          Container(
            height: 300,
            child: FutureBuilder<NewsModel>(
              future: _newsModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount:
                          snapshot.data.data.relationships.related.length,
                      itemBuilder: (context, index) {
                        var article =
                            snapshot.data.data.relationships.related[index];
                        // var formattedTime = DateFormat('dd MMM - HH:mm')
                        //     .format(article.publishedAt);
                        return ListTile(
                          title: Text(article.data.id.toString()),
                        );
                      });
                } else
                  return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
