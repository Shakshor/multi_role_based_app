import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_role_based_app/components/custom_button.dart';
import 'package:multi_role_based_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {

  // camera capture
  // variable declaration
  File? _image;

  // get image function
  Future getImage(ImageSource source) async {
    try{
      // source
      final image = await ImagePicker().pickImage(source: source);

      if(image == null) return;

      final imageTemporary = File(image.path);

      setState(() {
        this._image = imageTemporary;
      });
    } on PlatformException catch(e){
      print('Failed to pick image');
    }
  }


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
          title: Text('Student Screen'),
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

              // image capture
              Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _image != null ?
                      Image.file(
                        _image!,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                          :
                      Image.network('https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1683367888~exp=1683368488~hmac=1304ec660b83dec3005b10274d07ed67b13d5ae3646d2a80a0c2c8897a29276e',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                        ),
                    ],
                  ),

                  SizedBox(height: 30,),

                  // capture button
                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,

                    // custom button component
                    children: [

                      // from camera
                      CustomButton(
                        title: 'Capture An Image',
                        icon: Icons.camera,
                        onClick: () => getImage(ImageSource.camera),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 30,),


              // email info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,


                children: [
                  Text('Émail:'),
                  Text(email.toString()),
                ],
              ),

              const SizedBox(height: 20,),

              // age info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('Age:'),
                  Text(age.toString()),
                ],
              ),

              const SizedBox(height: 20,),

              // user info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('UserType:'),
                  Text(type.toString()),
                ],
              ),


              const SizedBox(height: 40,),

              // button ui
              InkWell(

                // button function
                onTap: () async {

                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.clear();

                  // navigate
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));

                },

                // button
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