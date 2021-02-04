import 'package:flutter/material.dart';
import 'package:News_App/Data/ArticleModel.dart';
import 'package:News_App/Data/CategoryList.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:News_App/Data/News.dart';
import 'package:News_App/RefactoredWidgest/BlogTile.dart';
import 'package:News_App/RefactoredWidgest/CategoryTile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = true;
  List<ArticleModel> articles = List<ArticleModel>();
  Future<void>getNews() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red[900],
        title: Row(
          children: [
            Text(
              'News',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Opacity(
              opacity: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.h,
                ),
                child: Icon(Icons.save),
              ))
        ],
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : RefreshIndicator(
            child: Container(
                child: Column(
                  children: [
                    Container(
                      height: 80.h,
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categoryNamesList.length,
                        itemBuilder: (context, index) {
                          return CatogaryTile(
                            catogaryName: categoryNamesList[index],
                            imageUrl: imageUrlList[index],
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].url,
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              onRefresh: getNews,
          ),
    );
  }
}
