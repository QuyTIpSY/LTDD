import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lake extends StatelessWidget {
  const Lake({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            child: Image.asset("assets/images/lake.jpg"),
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.all(16.0)),
              Column(
                children: [
                  Text("\nOeschinen Lake Campground", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                  Text("Kandersteg, Switzerland", style: TextStyle(color: Colors.grey), textAlign: TextAlign.left,),
                ],
              ),
              Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.red,),
                        Text("41", textAlign: TextAlign.right,),
                      ],
                    ),
                    margin: EdgeInsets.fromLTRB(200, 20, 30, 0),
                  )

                ],
              )
            ],
          ),
          Center(
            child: Row(
              children: [
                Padding(padding: EdgeInsets.all(16.0)),
                Container(
                  child: Column(
                    children: [
                      Icon(Icons.call, color: Colors.blue),
                      Text("CALL", style: TextStyle(color: Colors.blue),),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(40, 30, 75, 0),
                ),
                Container(
                  child:  Column(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue),
                      Text("ROUTE", style: TextStyle(color: Colors.blue),),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(40, 30, 75, 0),
                ),
                Container(
                  child:  Column(
                    children: [
                      Icon(Icons.share, color: Colors.blue),
                      Text("SHARE", style: TextStyle(color: Colors.blue),),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(40, 30, 75, 0),
                ),
              ],
            ),
          ),
          Container(
            child: Text("Lake Oeschinen lies ay the foot of the Bluemlisal in the Bẻ nế Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. Agondola ride from Kangdersteg, fllowed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run."),
            margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
          )
        ],
      ),
    );
  }
}