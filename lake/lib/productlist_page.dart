import 'package:flutter/material.dart';
import 'package:lake/model/product_model.dart';
import 'package:lake/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({Key? key}) : super(key: key);
  String? image;
  String? title;
  String? price;
  String? description;
  bool showGrid=true;

  List<ProductModel> listcart=[];

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getList();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCategory(context),
            SizedBox(height: 20,), // tạo khoảng cách giữa các khối

            buildSearch(context),
            SizedBox(height: 20,),

            buildGridList(context),
            SizedBox(height: 20,),
            showGrid? buildGridProducts(context):buildListProducts(context),
          ],
        ),
      ),
    );
  }

  buildCategory(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getList();
    return Container(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...productProvider.list.map((e) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: TextButton(onPressed: (){}, child: Text(e.category.toString()??""),),

                ); // Text(e.title ?? "Title is null");
              }).toList()
            ],
          ),
        )
    );
  }

  buildSearch(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
              width: 240,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              )
          ),
        ),
        Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_down)),
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_up)),
            IconButton(onPressed: (){}, icon: Icon(Icons.filter_alt_outlined)),
          ],
        ),
        ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>buildCartPage(context)));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Container(
            child: Row(
              children: [
                Icon(Icons.add_shopping_cart),
                Text("Cart ( ", style: TextStyle(fontWeight: FontWeight.bold),),
                Text(context.watch<CountProvider>().count.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                Text(" )", style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ],
    );
  }

  buildListProducts(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getList();
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ...productProvider.list.map((e) {
            return Container(
              child: Row(
                children: [
                  OutlinedButton(
                      onPressed: (){
                        title=(e.title).toString();
                        image=(e.image).toString();
                        price=(e.price).toString();
                        description=(e.description).toString();
                      },
                      child: Image.network(e.image??"", width: 100, height: 100,)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(e.title??"",),
                        Row(
                          children: [
                            Icon(Icons.price_change_outlined),
                            Text(e.price.toString()??""),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: (){
                              context.read<CountProvider>().add();
                              listcart.add(e);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreen[400],
                              padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text("🛒 Add to cart",)
                        )
                      ],
                    ),
                  ),
                  // SizedBox(height: 20,)
                ],
              ),
            );
          })
        ],
      ),
    );
  }

  buildGridProducts(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getList();
    return Expanded(
      child: Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,   // khoảng cách giữa 2 nhóm
          crossAxisSpacing: 20, // khoảng cách giữa 2 cột
          children: [
            ...productProvider.list.map((e) {
              return Column(
                children: [
                  OutlinedButton(
                      onPressed: (){
                        title=(e.title).toString();
                        image=(e.image).toString();
                        price=(e.price).toString();
                        description=(e.description).toString();
                      },
                      child: Image.network(e.image??"", width: 100, height: 100,)),
                  Text(e.title?? ""),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.price_change_outlined,),
                      Text(e.price.toString()??"",),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: (){
                        context.read<CountProvider>().add();
                        listcart.add(e);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen[400],
                        padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text("🛒 Add to cart",)
                  )
                ],
              ); // Text(e.title ?? "Title is null");
            }).toList()
          ],
        ),
      ),
    );
  }

  buildGridList(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(onPressed: (){
              showGrid=true;
            }, icon: Icon(Icons.grid_on)),
            IconButton(onPressed: (){
              showGrid=false;
            }, icon: Icon(Icons.list_alt)),
          ],
        )
      ],
    );
  }

  buildCartPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quay lại'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Expanded(
            child: ListView(
              children: [
                ...listcart.map((e) {
                  return Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(e.image.toString(), width: 100, height: 100,),
                        Expanded(
                          child: Column(
                            children: [
                              Text((e.title.toString())),
                              Row(
                                children: [
                                  Icon(Icons.price_change_outlined),
                                  Text(e.price.toString()??""),

                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed: (){
                                    context.read<CountProvider>().add();
                                  }, icon: Icon(Icons.add)),
                                  Text(context.watch<CountProvider>().count.toString()),
                                  TextButton(onPressed: (){
                                    context.read<CountProvider>().sub();
                                  }, child: Text('➖'))
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                              //     Text('10'),
                              //     IconButton(onPressed: (){}, icon: Icon(Icons.maximize)),
                              //   ],
                              // )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                })
              ],
            ),
          )
      ),
    );
  }
}