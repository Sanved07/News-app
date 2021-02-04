import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:News_App/Data/ArticleModel.dart';
import 'package:News_App/Data/News.dart';
import 'package:News_App/RefactoredWidgest/BlogTile.dart';

class CategoryNews extends StatefulWidget {
  final String catogary;
  CategoryNews({this.catogary});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCatogaryNews();
  }

  Future<void>getCatogaryNews() async {
    CategoryNewsClass news = CategoryNewsClass();
    await news.getCategoryNews(widget.catogary);
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            ),
          ),
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
              onRefresh: getCatogaryNews,
          ),
    );
  }
}
