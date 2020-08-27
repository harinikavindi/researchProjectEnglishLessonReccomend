import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Speaking(),
    );
  }
}

class Speaking extends StatefulWidget {
  @override
  Speaking() : super();
  SpeakingState createState() => SpeakingState();
}

class SpeakingState extends State<Speaking> {
 GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 5.0,
        backgroundColor: Color.fromRGBO(61, 212, 125, 100),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        title: Row(
          children: <Widget>[
            SizedBox(
              width: 15,
            ),
            Container(
              //margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Learn English',
                        style: TextStyle(fontSize: 25.0, fontFamily: 'Lobster'),
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 12.0,
                        ),
                        SizedBox(width: 4.0),
                        Text('English Lessons',
                            style: TextStyle(fontSize: 12.0))
                      ],
                    ),
                  ]),
            )
          ],
        ),
        actionsIconTheme:
            IconThemeData(size: 30.0, color: Colors.white, opacity: 100.0),
      ),
//       body: ListPage(),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(61, 212, 125, 100),
//                 image: const DecorationImage(
//                   image: NetworkImage(
//                       'https://i.pinimg.com/originals/17/56/20/1756208b78720991768297bf89d27f2b.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(height: 1.0),
//             ListTile(
// //              leading: Icon(
// //                Icons.home,
// //                color: Color.fromRGBO(61, 212, 125, 100),
// //              ),
//               title: Text("Welcome to English App"+" " + loggedEmail,style: TextStyle(fontSize: 15.0, fontFamily: 'Lobster'),),
//             ),
//             SizedBox(height: 1.0),
//             ListTile(
//               leading: Icon(
//                 Icons.home,
//                 color: Color.fromRGBO(61, 212, 125, 100),
//               ),
//               title: Text("Home"),
//               onTap: () {
//                 //Navigate to Home

//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => Home()));
//               },
//             ),
//             SizedBox(height: 18.0),
//             ListTile(
//               leading: Icon(
//                 Icons.power_settings_new,
//                 color: Color.fromRGBO(61, 212, 125, 100),
//               ),
//               title: Text("Logout"),
//               onTap: () {
//                 _signOut(context);
//               },
//             ),
//           ],
//         ),
      // ),
    );
  }
  
  
}