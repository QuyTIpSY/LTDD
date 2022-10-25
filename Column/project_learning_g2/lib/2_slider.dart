import 'dart:core';

import 'package:flutter/material.dart';

class MonHoc {
  String tenMH;
  String maMH;
  String tenNhom;
  String maNhom;
  String namHoc;
  String HK;
  int soLuong;
  String anhNen;

  MonHoc(this.tenMH, this.maMH, this.tenNhom, this.maNhom, this.namHoc, this.HK, this.soLuong, this.anhNen);
}

class SliderPage extends StatelessWidget {
  SliderPage({Key? key}) : super(key: key);
  List<String> list = [
    'assets/images/slider/a1.jpg',
    'assets/images/slider/a2.jpg',
    'assets/images/slider/a3.jpg',
  ];
  
  List<MonHoc> listMH = [
    new MonHoc("Thực tập viết niên luận", "TIN3142", "Nhóm 3", "003", "2021-2022", "2", 7, 'assets/images/classroom/clr1.jpg'),
    new MonHoc("Công nghệ XML", "TIN4412", "Nhóm 1", "001", "2021-2022", "2", 10, 'assets/images/classroom/clr2.jpg'),
    new MonHoc("Lập trình Front-End", "TIN3092", "Nhóm 12", "012", "2021-2022", "2", 36, 'assets/images/classroom/clr3.jpg'),
    new MonHoc("Lập trình Front-End", "TIN3092", "Nhóm 11", "011", "2021-2022", "2", 35, 'assets/images/classroom/clr1.jpg'),
    new MonHoc("Lập trình Front-End", "TIN3092", "Nhóm 10", "010", "2021-2022", "2", 14, 'assets/images/classroom/clr4.jpg'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Center(
      //     child: Text("Complicated image slider demo"),
      //   ),
      // ),
      body: SingleChildScrollView(
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
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...list.map((e) {
                return Container(
                  margin: EdgeInsets.all(10),
                  height: 300,
                  width: MediaQuery.of(context).size.width,   // Lấy kích thước chiều rộng màn hình
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
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ...listMH.map((e) {
                return Container(
                  // height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image:DecorationImage(
                        image: AssetImage(e.anhNen),
                        fit: BoxFit.cover
                    ),
                  ),
                  padding: EdgeInsets.all(14),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("[" + e.namHoc + "." + e.HK + "] - " + e.tenMH + " - " + e.tenNhom, style: TextStyle(color: Colors.white, fontSize: 24),),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(e.namHoc + "." + e.HK + "." + e.maMH + "." + e.maNhom, style: TextStyle(color: Colors.white),),
                        )
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: Align(
                            alignment: Alignment.topLeft,
                          child: Text(e.soLuong.toString() + " học viên", style: TextStyle(color: Colors.white),),
                        )
                      )
                    ],
                  ),
                );
              })
            ],
          ),
        )
    );
  }
}
