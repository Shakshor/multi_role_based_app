import 'package:flutter/material.dart';
import 'package:multi_role_based_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // states
  String email = '', age = '', type = '';


  // initState function
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // calling the load function
    loadData();

  }


  // load data function creating
  loadData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();

    email = sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    type = sp.getString('userType') ?? '';

    setState(() {

    });

  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        // appBar
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),

        // main body
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              // email data
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,


                children: [
                  Text('Émail:'),
                  Text(email.toString()),
                ],
              ),

              const SizedBox(height: 20,),

              // age data
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('Age:'),
                  Text(age.toString()),
                ],
              ),

              const SizedBox(height: 20,),

              // userType data
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('userType:'),
                  Text(type.toString()),
                ],
              ),


              const SizedBox(height: 40,),

              // button
              InkWell(

                // pressed function
                onTap: () async {

                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.clear();

                  // navigate
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));

                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.green,
                  child: const Center(
                    child: Text('Logout', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
