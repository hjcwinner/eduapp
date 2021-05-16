import 'package:eduapp/contants.dart';
import 'package:eduapp/detail.dart';
import 'package:eduapp/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edu app',
      theme: ThemeData(),
      home: DetailScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SvgPicture.asset("assets/icons/menu.svg"),
              Image.asset("assets/images/user.PNG")
            ]),
            SizedBox(height: 30),
            Text(
              "안녕 하준희",
              style: kHeadingextStyle,
            ),
            Text("원하는 코스의 교육을 찾으세요", style: kSubheadingextStyle),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFF5E5F7),
                  borderRadius: BorderRadius.circular(40)),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/search.svg"),
                  SizedBox(width: 16),
                  Text(
                    "원하는 수업을 찾으세요",
                    style: TextStyle(fontSize: 18, color: Color(0xFFA0A5BD)),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('카테고리', style: kTitleTextStyle),
                Text('모두보기',
                    style: kSubtitleTextSyule.copyWith(color: kBlueColor))
              ],
            ),
            SizedBox(height: 30),
            Expanded(
                child: StaggeredGridView.countBuilder(
                    padding: EdgeInsets.all(0),
                    itemCount: categories.length,
                    crossAxisSpacing: 20,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    itemBuilder: (context, index) {
                      return Container(
                        height: index.isEven ? 200 : 240,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(categories[index].image),
                              fit: BoxFit.fill,
                            )),
                        child: Column(
                          children: [
                            Text(
                              categories[index].name,
                              style: kTitleTextStyle,
                            ),
                            Text(
                              '${categories[index].numOfCourses} 코스',
                              style:
                                  TextStyle(color: kTextColor.withOpacity(.6)),
                            )
                          ],
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1)))
          ],
        ),
      ),
    );
  }
}
