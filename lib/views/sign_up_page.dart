// ignore_for_file: unused_import
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_flutterapp/controllers/auth_controller.dart';
import 'package:my_flutterapp/views/login_page.dart';
import 'package:get/get.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    List images = ["f.png", "g.jpg", "t.jpg"];

    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.30,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/signup.png"
                      ),
                      fit: BoxFit.fill
                  )
              ),
              child: Column(
                children: [
                  SizedBox(height: h * 0.13,),
                  const CircleAvatar(
                    backgroundColor: Colors.lightBlueAccent,
                    radius: 50,
                    backgroundImage: AssetImage(
                        "assets/images/account_icon.png"
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2)
                          )
                        ]
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: "Email here",
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.lightBlueAccent,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2)
                          )
                        ]
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password here",
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Colors.lightBlueAccent,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                AuthController.instance.register(emailController.text.trim(),
                    passwordController.text.trim());
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.08,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                        image: AssetImage(
                            "assets/images/loginbtn.jpg"
                        ),
                        fit: BoxFit.fill
                    )
                ),
                child: const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox( height: 20,),
            RichText(text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap= () {
                  Get.back();
                },
              text:"Have An Account ?",
              style: TextStyle(
               fontSize: 20,
                color: Colors.grey[500],

              )
            )
            ),
            SizedBox(height: h * 0.12,),
            RichText(
              text: TextSpan(
                text: "Sign Up using on of the following",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 20,
                ),
              ),
            ),
            Wrap(
              children: List<Widget>.generate(
                  3,
                      (index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blueGrey,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                            "assets/images/" + images[index],
                          ),
                        ),
                      ),
                    );
                  }
              ) ,
            )
          ],
        ),
      ),
    );
  }
}
