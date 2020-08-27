import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'vocabulory.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'reading.dart';
import 'package:flutter_auth/login.dart';
// import 'writing.dart';
// import 'speaking.dart';
import 'about.dart';
import 'lessonList.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:url_launcher/url_launcher.dart';
// import 'listning.dart';
// import 'api.dart';
 import 'signup.dart';



// 
class Home extends StatelessWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  final appTitle = 'Learn English - Home Page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
_signOut(BuildContext context) async {
  await _firebaseAuth.signOut();
  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
}

class MyHomePage extends StatelessWidget {
  final String title;

  //  String loggedEmail;
  //  SharedPreferences logindata;

  // @override
  // void initState() {
  //   super.initState();
  //   initial();
  // }
  // //Store logged user's username(email)
  // void initial() async {
  //   logindata = await SharedPreferences.getInstance();
  //   setState(() {
  //     loggedEmail = logindata.getString('email');
  //   });
  // }

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),backgroundColor: Color(0xff9c27b0),),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text("Let's Get Started !!!!", 
                style: TextStyle(fontSize: 20),),
                textColor: Colors.white,
               
                color: Color(0xff9c27b0),
                padding: EdgeInsets.all(50),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LessonList()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Helloo Dear User!!!!!',  style: TextStyle(fontSize: 30, color: Colors.white)),
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
            ),
            ListTile(
              title: Text('About'),
               leading: Icon(
                Icons.home,
                color: Color(0xff9c27b0),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => About()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Color(0xff9c27b0),
              ),
              title: Text("Home"),
              onTap: () {
                //Navigate to Home

                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            SizedBox(height: 18.0),
            ListTile(
              leading: Icon(
                Icons.power_settings_new,
                color: Color(0xff9c27b0),
              ),
              title: Text("Logout"),
              onTap: () {
                _signOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
 