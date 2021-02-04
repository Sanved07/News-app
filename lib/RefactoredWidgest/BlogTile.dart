import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:News_App/Screens/ArticleScreen.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  BlogTile({this.imageUrl, this.title, this.desc, this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleScreen(
              url: url,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(8.h),
          child: Column(
            children: [
              ClipRRect(
                child: Image.network(imageUrl),
                borderRadius: BorderRadius.circular(10.h),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 18.h, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                desc,
                style: TextStyle(fontSize: 15.h, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
