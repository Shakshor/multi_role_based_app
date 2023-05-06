import 'package:flutter/material.dart';
import 'package:multi_role_based_app/home_screen.dart';
import 'package:multi_role_based_app/student_screen.dart';
import 'package:multi_role_based_app/teacherScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  // dropdown value
  var userTypes = ['teacher', 'student', 'admin'];

  // initial selected value
  String dropdownValue = 'teacher';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          // appBar
          appBar: AppBar(
            title: const Text('Please SignUp', style: TextStyle(fontSize: 23),),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),



          // body
          body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // form field
            // email
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),

            SizedBox(height: 20,),

            // password
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),

            SizedBox(height: 20,),


            // age
            TextFormField(
              keyboardType: TextInputType.number,
              controller: ageController,
              decoration: const InputDecoration(
                hintText: 'age',
              ),
            ),

            SizedBox(height: 20,),



            // user type dropdown
            TextFormField(

                decoration: InputDecoration(
                    suffixIcon: DropdownButton<String>(
                      value: dropdownValue,
                      items: userTypes.map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem(
                            value: value,
                            child: Text(value));
                      }).toList(),
                      onChanged: (String? newValue){
                        setState(() {

                          dropdownValue = newValue!;
                        });
                      },
                    ),
                    hintText: 'UserType'
                )
            ),



            SizedBox(height: 40,),



            // button
            InkWell(

              // pressed function
              onTap: () async {

                SharedPreferences sp = await SharedPreferences.getInstance();

                // set  form data
                sp.setString('email', emailController.text.toString());
                sp.setString('age', ageController.text.toString());
                // userType set
                sp.setString('userType', dropdownValue.toString());

                sp.setBool('isLogin', true);




                // navigate to different page
                if(sp.getString('userType') == 'student'){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudentScreen())
                  );
                }
                else if(sp.getString('userType') == 'teacher'){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TeacherScreen())
                  );
                }
                else{
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen())
                  );
                }

              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.blue,
                child: const Center(
                  child: Text('Sign Up', style: TextStyle(fontSize: 23, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}




// future function

// Future<double>introToFuture() async {
//   await Future.delayed(Duration(seconds: 5));
//
//   print('In Future');
//
//   return 2.00;
// }



// Shared Preference (implemented in onTap)

// SharedPreferences sp = await SharedPreferences.getInstance();
// // data store
// sp.setString('name', 'Flutter Learning');
// sp.setInt('age', 26);
// sp.setBool('login', false);
//
// // get value
// print(sp.getString('name'));
// print(sp.getInt('age').toString());
// print(sp.getBool('login'));
//
// // remove value
// sp.remove('name');
// print(sp.getString('name'));





// DropdownButton

// DropdownButton<String>(
// value: dropdownValue,
// items: userTypes.map<DropdownMenuItem<String>>((String value){
// return DropdownMenuItem(
// value: value,
// child: Text(value));
// }).toList(),
// onChanged: (String? newValue){
// setState(() {
// dropdownValue = newValue!;
// print(dropdownValue);
// });
// },
// ),
