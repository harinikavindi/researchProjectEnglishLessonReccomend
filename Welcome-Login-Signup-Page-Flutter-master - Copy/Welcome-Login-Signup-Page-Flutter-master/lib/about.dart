import 'package:flutter/material.dart';
import 'package:flutter_auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

//void main() => runApp(MyApp());

class About extends StatelessWidget {
  const About({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  final appTitle = 'Learn English - About page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyAboutPage(title: appTitle),
    );
  }
}

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
_signOut(BuildContext context) async {
  await _firebaseAuth.signOut();
  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
}

// class About extends StatefulWidget {
//  const About({Key key, this.user}) : super(key: key);
//   final FirebaseUser user;
//   final appTitle = 'Learn English';

// }

class MyAboutPage extends StatelessWidget {
  final String title;

  MyAboutPage({Key key, this.title}) : super(key: key);

  

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),backgroundColor: Color(0xff9c27b0)),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('This app is basically for university students. \n They can work with the app and improve your English skills'),
            RaisedButton(
              child: Text("Go back", 
              style: TextStyle(fontSize: 20),),
              textColor: Colors.purple,
              
              color: Colors.white,
              padding: EdgeInsets.all(10),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              }
            ),
          ],
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
              child: Text('Helloo!!', style: TextStyle(fontSize: 30, color: Colors.white)),
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
              
// class AboutDetailPage extends StatefulWidget {
//   //final DocumentSnapshot flower;
//   //DetailPage({this.flower});

//   @override
//   _AboutDetailPageState createState() => _AboutDetailPageState();
// }

// class _AboutDetailPageState extends State<AboutDetailPage> {
// double screenHeight;
//   @override
//   Widget build(BuildContext context) {
//     screenHeight = MediaQuery.of(context).size.height;
//     return new Scaffold(
//       appBar: AppBar(
//         elevation: 20.0,
//         backgroundColor: Color.fromRGBO(61, 212, 125, 100),
//         title: Row(
//           children: <Widget>[
//             SizedBox(
//               width: 15,
//             ),
//             Container(
//                 margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
//                 child: CircleAvatar(
//                   backgroundImage: ExactAssetImage('images/logo.png'),
//                   radius: 25.0,
//                 ),
//                 decoration: new BoxDecoration(
//                   border: new Border.all(
//                     color: Colors.pink,
//                     width: 1.0,
//                   ),
//                   borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
//                 )),
//             Container(
//               //margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                       child: Text(
//                         'EnlishApp',
//                         style: TextStyle(fontSize: 25.0, fontFamily: 'Lobster'),
//                       ),
//                     ),
//                     SizedBox(height: 4.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.white,
//                           size: 12.0,
//                         ),
//                         SizedBox(width: 4.0),
//                         Text('About English App',
//                             style: TextStyle(fontSize: 12.0))
//                       ],
//                     ),
//                   ]),
//             )
//           ],
//         ),
//         actionsIconTheme:
//             IconThemeData(size: 30.0, color: Colors.white, opacity: 100.0),
//       ),
//       body: ListView(
//         children: <Widget>[
//           SizedBox(height: 18.0),
//           ListTile(
//               title: Text(
//                   'FlowerSnap - A mobile application to learn about flowers')),
//           SizedBox(height: 18.0),
//           ListTile(
//             title: Text(
//                 'FlowerSnap consolidates a list of flowers along with flower names, a brief description, a photo, and some guidance for those of you who are interested in gardening.'),
//           ),
//           ListTile(
//             title: Text('Logged-in users can:'),
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.local_florist,
//               color: Color.fromRGBO(61, 212, 125, 100),
//             ),
//             title: Text('View a list of available flower details'),
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.share,
//               color: Color.fromRGBO(61, 212, 125, 100),
//             ),
//             title: Text('Share flower details'),
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.language,
//               color: Color.fromRGBO(61, 212, 125, 100),
//             ),
//             title:
//                 Text('Browse for further details using suggested references'),
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.add,
//               color: Color.fromRGBO(61, 212, 125, 100),
//             ),
//             title: Text('Add an entry to the application'),
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.update,
//               color: Color.fromRGBO(61, 212, 125, 100),
//             ),
//             title: Text('Update an entry uploaded by them'),
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.delete,
//               color: Color.fromRGBO(61, 212, 125, 100),
//             ),
//             title: Text('Remove an entry uploaded by them'),
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.search,
//               color: Color.fromRGBO(61, 212, 125, 100),
//             ),
//             title: Text('Search for flower details'),
//           ),
//         ],
//       ),
//     );
//   }
// }
