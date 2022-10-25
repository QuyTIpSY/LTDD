import 'package:flutter/material.dart';
class TestRow extends StatelessWidget {
  TestRow({Key? key}) : super(key: key);
  final List<String> _list = [
    'assets/images/b1.jpg',
    'assets/images/b2.jpg',
    'assets/images/b3.jpg',
    'assets/images/b4.jpg',
    'assets/images/b5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complicated image slider demo"),
      ),
      body: SafeArea(
          child: Column(
            children: [
              // buildRowSlider(context),
              buildListImage(context),
            ],
          )
      ),
    );
  }

  buildRowSlider(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity, // rộng vô cực
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ..._list.map((e) { // map = foreach: duyệt qua từng phần tử trong mảng
              return Container(
                margin: EdgeInsets.all(10),
                height: 300,
                width: MediaQuery
                    .of(context)
                    .size
                    .width, // auto lấy độ rộng của màn hình đth
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(e),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  buildListImage(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/b1.jpg"),
            Image.asset("assets/images/b1.jpg"),
            Image.asset("assets/images/b1.jpg"),
          ],
        ),
      ),
    );
  }
}
