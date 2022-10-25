import 'dart:js';

import 'package:flutter/material.dart';
import 'package:lake/colum.dart';
import 'package:lake/food.dart';
import 'package:lake/food2.dart';
import 'package:lake/lake.dart';
import 'package:lake/login_page.dart';
import 'package:lake/login_page2.dart';
import 'package:lake/productlist_page.dart';
import 'package:lake/provider/product_provider.dart';
import 'package:lake/row.dart';
import 'package:lake/signup_page.dart';
import 'package:provider/provider.dart';


// void main() {
//   runApp(MaterialApp(
//     // home: Lake(),
//     // home: TestRow(),
//     // home: TestColum(),
//     // home: Food(),
//     // home: Food2(),
//     // home: LoginPage(),
//     home: LoginPage2(),
//     // home: SignUpPage(),
//   ));
// }

void main(){
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>ProductProvider()),
          ChangeNotifierProvider(create: (context)=>CountProvider()),
        ],
      child: MaterialApp(
        home: ProductListPage(),
      ),
  ));
}

