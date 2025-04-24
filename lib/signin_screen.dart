import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _nameEmailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  bool isObscureText=true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    "Welcome \nBack!",
                    style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _nameEmailController,
                  decoration: InputDecoration(
                      fillColor: Color(0xffF3F3F3),
                      filled: true,
                      hintText: "Username or Email",
                      prefixIcon: Image(image: AssetImage("images/ic_user.png")),
                      hintStyle: TextStyle(color: Color(0xff676767)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: isObscureText,
                    decoration: InputDecoration(
                        fillColor: Color(0xffF3F3F3),
                        filled: true,
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility_outlined),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.all(Radius.circular(12))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(12)))),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    width: double.infinity,
                    child: Text(
                      "Forgot Password?",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 12, color: Color(0xffF83758)),
                    )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () => {
                          print("UserName::${_nameEmailController.text}"),
                          print("Password::${_passwordController.text}")
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffF83758),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6))),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ))),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Column(
                    children: [
                      Text("- OR Continue with -"),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage("images/ic_google.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Image(image: AssetImage("images/ic_apple.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Image(image: AssetImage("images/ic_facebook.png")),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Create An Account",
                          style: TextStyle(color: Color(0xff575757),fontSize: 14),),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Signup",
                            style: TextStyle(
                                color: Color(0xffF83758),
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xffF83758),
                              decorationThickness: 2
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
