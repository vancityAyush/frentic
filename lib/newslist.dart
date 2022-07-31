import 'package:flutter/material.dart';
import 'package:frentic/Home_page.dart';
import 'package:frentic/api/news_api.dart';
import 'package:frentic/models/News.dart';
import 'package:frentic/news_page.dart';

class News_list extends StatefulWidget {
  @override
  _News_listState createState() => _News_listState();
}

class _News_listState extends State<News_list>
    with SingleTickerProviderStateMixin {
  List<String> newsTypes = [
    "Finance",
    "Politics",
    "Lifestyle",
    "Technology",
    "Entertainment",
    "Sports",
    "Travels",
  ];
  late String userkey;
  NewsApiManager newsApiManager = NewsApiManager();
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: newsTypes.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "News",
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Home();
                  },
                ),
              );
            },
          ),
          bottom: TabBar(
            indicatorColor: Colors.black54,
            isScrollable: true,
            labelColor: Colors.black,
            controller: _tabController,
            tabs: [
              for (String newsType in newsTypes)
                Tab(
                  text: newsType,
                ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          controller: _tabController,
          children: [
            buildNewsList(newsApiManager.getFinanceNews),
            buildNewsList(newsApiManager.getPoliticsNews),
            buildNewsList(newsApiManager.getLifeStyleNews),
            buildNewsList(newsApiManager.getTechNews),
            buildNewsList(newsApiManager.getEntertainmentNews),
            buildNewsList(newsApiManager.getSportsNews),
            buildNewsList(newsApiManager.getTravelNews),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<News>> buildNewsList(dynamic getData) {
    return FutureBuilder<List<News>>(
      future: getData(),
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<News> news = snapshots.data!;
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Info(news[index]);
                    },
                  ),
                );
              },
              contentPadding: EdgeInsets.all(12),
              leading: Image.network(
                news[index].img,
                fit: BoxFit.cover,
              ),
              title: Text(
                news[index].title,
              ),
            );
          },
          itemCount: news.length,
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 1,
              color: Colors.black,
            );
          },
        );
      },
    );
  }
}
