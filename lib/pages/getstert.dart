import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:maly/pages/loginpage.dart';
import 'package:maly/pages/singup.dart';

import 'buttom_navegetor_bar.dart';


class Start extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(child:  Scaffold(
backgroundColor:Colors.blue[900],

      body: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 3),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget> [
               SizedBox(height: 10),

              Image.asset('assets/images/logo.png',
                width: 200, height: 200,
              ),
              SizedBox(height: 60),
              Text('Welcome...!',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                  color:Colors.green
              ),),
              SizedBox(height: 40),
              Text('Create an Account And Get Access to all Services...',
                style: TextStyle(
                    color: Colors.blue
                ),
              ),
              SizedBox(height: 60),
              MaterialButton(
                  elevation: 5.0,
                  color: Colors.orange[900],
                  padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 80
                  ),
                  child: const Text('Get Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none
                  ),
                  onPressed: () {
                    Get.to(Signup());
                  }
              ),
              TextButton(
                onPressed: () {
                 Get.to(LoginScrren());
                },
                child: Text('Already have an account? Login',
                style: TextStyle(
                  color: Colors.blue
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
