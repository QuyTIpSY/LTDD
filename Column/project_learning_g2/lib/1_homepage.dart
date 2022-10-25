// gõ stl + tab
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String src = "https://images.unsplash.com/photo-1662402293121-f25baa3718a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1NHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60&fbclid=IwAR3rRQpTjMC_u8NLxqZu_p7dhs0d12ApUJqvPaM7pCsmY7-WUkAY1f1RBfw";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World App!"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                  "Welcome to my class",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                ),
              ),
              Text("Mobile Programing Group 2"),
              Image.network(src),
              Image.asset("assets/images/wibu.jpg"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Xin chao");
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Icon(Icons.home),
      ),
    );
  }
}
