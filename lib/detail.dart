import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eduapp/contants.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ux_big.png"),
                alignment: Alignment.topRight),
            color: Color(0xFFF5F4EF)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/icons/arrow-left.svg"),
                      SvgPicture.asset("assets/icons/more-vertical.svg")
                    ],
                  ),
                  SizedBox(height: 30),
                  ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      color: kBestSellerColor,
                      padding: EdgeInsets.only(
                          left: 10, top: 5, right: 20, bottom: 5),
                      child: Text(
                        "BestSeller".toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "플러터 코딩하기",
                    style: kHeadingextStyle,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/person.svg"),
                      SizedBox(width: 5),
                      Text("18k"),
                      SizedBox(width: 20),
                      SvgPicture.asset("assets/icons/star.svg"),
                      SizedBox(width: 5),
                      Text("4.8"),
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(
                          text: "\$50 ",
                          style: kHeadingextStyle.copyWith(fontSize: 32)),
                      TextSpan(
                          text: "\$70",
                          style: TextStyle(
                              color: kTextColor.withOpacity(.5),
                              decoration: TextDecoration.lineThrough))
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(height: 60),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 30, top: 10, right: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.white),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "코스내용",
                          style: kTitleTextStyle,
                        ),
                        SizedBox(height: 30),
                        CourseContent(
                          number: "01",
                          duration: 5.35,
                          title: "시작단계",
                          isDone: true,
                        ),
                        CourseContent(
                          number: "02",
                          duration: 5.35,
                          title: "1단계 코스 시작",
                          isDone: true,
                        ),
                        CourseContent(
                          number: "03",
                          duration: 5.35,
                          title: "2단계 코스 시작",
                          isDone: false,
                        ),
                        CourseContent(
                          number: "04",
                          duration: 5.35,
                          title: "3단계 코스 시작",
                          isDone: false,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 50,
                                  color: kTextColor.withOpacity(.1))
                            ]),
                        height: 100,
                        width: double.infinity,
                        child: Row(children: [
                          Container(
                            padding: EdgeInsets.all(14),
                            height: 56,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(0xffffedee),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: SvgPicture.asset(
                                "assets/icons/shopping-bag.svg"),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 56,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: kBlueColor),
                              child: Text("구매하기", style: kSubtitleTextSyule.copyWith(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          )
                        ]),
                      ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;

  const CourseContent({
    Key key,
    this.number,
    this.duration,
    this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Text(
            number,
            style: kHeadingextStyle.copyWith(
                color: kTextColor.withOpacity(.15), fontSize: 32),
          ),
          SizedBox(width: 20),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "$duration mins\n",
                style: TextStyle(
                    color: kTextColor.withOpacity(0.5), fontSize: 18)),
            TextSpan(
                text: title,
                style: kSubtitleTextSyule.copyWith(
                    fontWeight: FontWeight.w600, height: 1.5))
          ])),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kGreenColor.withOpacity(isDone ? 1 : .5)),
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
