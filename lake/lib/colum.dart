import 'package:flutter/material.dart';
class TestColum extends StatelessWidget {
  const TestColum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/c1.jpg"),
            Image.asset("assets/images/c2.jpg"),
            Image.asset("assets/images/c3.jpg"),
            Image.asset("assets/images/c4.jpg"),
            Image.asset("assets/images/c5.jpg"),
          ],
        ),
        ),
      ),
    );
  }
}
