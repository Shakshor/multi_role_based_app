import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_role_based_app/home_screen.dart';
import 'package:multi_role_based_app/login_screen.dart';
import 'package:multi_role_based_app/student_screen.dart';
import 'package:multi_role_based_app/teacherScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // function
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // navigate to home screen
    // Timer(Duration(seconds: 5), (){
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => LoginScreen()) );
    // });

    // calling the login function
    isLogin();

  }

  // login checking function
  void isLogin() async {

    // initialize shared_pre..
    SharedPreferences sp = await SharedPreferences.getInstance();

    // get the stored data
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';

    // condition check
    if(isLogin){

      // user type condition check
      if(userType == 'student'){
          Timer(Duration(seconds: 3),(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => StudentScreen()));
          });
        }
        else if(userType == 'teacher'){
          Timer(
              Duration(seconds: 3), (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> TeacherScreen()));
          });
        }
        else{
          Timer(Duration(seconds: 3), (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
          });
      }

    }
    else{
      Timer(Duration(seconds: 3),(){
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage('https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),),
    );
  }

}
