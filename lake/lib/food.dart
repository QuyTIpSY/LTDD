import 'package:flutter/material.dart';
class Food extends StatefulWidget {
  Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  List<String> list=[      // tạo list phải bỏ const đi
    'assets/images/b1.jpg',
    'assets/images/b2.jpg',
    'assets/images/b3.jpg',
    'assets/images/b4.jpg',
  ];
  bool showGrid=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle(context),
            SizedBox(height: 20,), // tạo khoảng cách giữa các khối

            buildWelcome(context),
            SizedBox(height: 20,),

            buildSearch(context),
            SizedBox(height: 20,),

            buildSavedPlace(context),
            SizedBox(height: 20,),

            showGrid? buildGrid(context):buildList(context),
          ],
        ),
      ),
    );
  }

  buildTitle(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,  // căn phải
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: (){}, icon: Icon(Icons.extension)),
        ],
      ),
    );
  }

  buildWelcome(BuildContext context) {
    return const Text.rich(
        TextSpan(
          text: "Welcome, ",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: "Charlie",
              style: TextStyle(fontWeight: FontWeight.normal)
            )
          ]
        )
    );
  }

  buildSearch(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );
  }

  buildSavedPlace(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Saved Place",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Row(
          children: [
            IconButton(onPressed: (){

              setState(() {
                showGrid=true;
              });
            }, icon: Icon(Icons.grid_3x3)),
            IconButton(onPressed: (){

              setState(() {
                showGrid=false;
              });
            }, icon: Icon(Icons.list)),
          ],
        )
      ],
    );
  }

  buildGrid(BuildContext context) {
    return Expanded(    //Expanded
        child: GridView.count( // phương thức khởi tạo
          crossAxisCount: 2,
          mainAxisSpacing: 20,   // khoảng cách giữa 2 nhóm
          crossAxisSpacing: 20, // khoảng cách giữa 2 cột
          children: [
            ...list.map((e){
              return Container(
                // height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(e),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
              );
            })
          ],// số lượng cột
        )
    ); // chứa hết k gian còn lại
  }

  buildList(BuildContext context) {
    return Expanded(child:
      ListView(
        scrollDirection: Axis.vertical,
        children: [
          ...list.map((e){
            return Container(
              height: 200,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(e),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            );
          })
        ],
      )
    );
  }
}
