import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var _formkey=GlobalKey<FormState>();
  var _UserNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty)
                    return "rỗng";
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Nhập tên đăng nhập",
                  label: Text("Tên đăng nhập"),
                  prefixIcon: Icon(Icons.person)
                ),
                controller: _UserNameController,
              ),

              ElevatedButton(
                  onPressed: (){
                    if(_formkey.currentState!.validate()){
                     // print("Xin chào: ${_UserNameController}")
                      var snackBar=SnackBar(
                          content: Row(
                            children: [
                              Icon(Icons.person, color: Colors.white,),
                              Text("Xin chào: ${_UserNameController.text}"),
                            ],
                          )
                      );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text("Đăng nhập")
              )
            ],
          ),
        ),
      ),
    );
  }
}
