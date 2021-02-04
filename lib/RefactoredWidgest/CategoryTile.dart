import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:News_App/Screens/CatogaryScreen.dart';

class CatogaryTile extends StatelessWidget {
  final imageUrl, catogaryName;
  CatogaryTile({this.imageUrl, this.catogaryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryNews(
              catogary: catogaryName.toLowerCase(),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.h, vertical: 8.h),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.h),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120.h,
                height: 60.h,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120.h,
              height: 60.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black26),
              child: Text(
                catogaryName,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
