import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String _email='';
  String _password='';
  void signIn(BuildContext context) async {
    
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password:_password)
        .catchError((e) {
          print("$e".toString()); 
       
    }).then((authUser) {
      if (authUser.user!= null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    });
  
  }

  @override
  Widget build(BuildContext context) {
    

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: [
                    Image.asset(
                      bgImage,
                      fit: BoxFit.contain,
                      height: height * 0.40,
                      width: width,
                    ),
                    Container(
                      height: height * 0.45,
                      width: width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              stops: [0.3, 0.8],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.white,
                              ])),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              text: "$appName\n",
                              children: [
                                TextSpan(
                                    text: slogan,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ))
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        primaryColor.withOpacity(0.3),
                        primaryColor.withOpacity(0.1)
                      ]),
                      border: const Border(
                        left: BorderSide(color: primaryColor, width: 5),
                      ),
                    ),
                    child: const Text(
                      " $loginScreen",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    onSaved: (newValue) {
                      _email = newValue!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your email";
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                          .hasMatch(value)) {
                        return "its not a valid email";
                      }

                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor)),
                      prefixIcon: Icon(
                        Icons.email,
                        color: primaryColor,
                      ),
                      labelText: "EMAIL ADDRESS",
                      labelStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  child: TextFormField(
                    onSaved: (newValue) {
                      _password = newValue!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Password";
                      } else if (value.length < 8 || value.length > 15) {
                        return "Password is invalid";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor)),
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: primaryColor,
                      ),
                      labelText: "PASSWORD",
                      labelStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: const Text(forgotText)),
                ),
                Center(
                  child: SizedBox(
                      height: height * 0.06,
                      width: width - 30,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState?.save();
                              signIn(context);
                              // if (_email == "kathir555@gmail.com" &&
                              //     _password == "kathir@07") {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               const HomeScreen()));
                              // }
                              //else{
                             //  print("invalid");
                            //  }
                              
                            }
                
                FocusScope.of(context).unfocus();
                          },
                          
                          child: const Text("Login to Account",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 0.5)))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account ?"),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}

