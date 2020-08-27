import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
import 'about.dart';
import 'vocabulory.dart';

//void main() => runApp(MyApp());

class LessonList extends StatelessWidget {
  const LessonList({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  final appTitle = 'Learn English - Get started !! ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle, 
      home: MyLessonListPage(title: appTitle),
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

class MyLessonListPage extends StatelessWidget {

  //final firestoreInstance = Firestore.instance;
  final String title;

  MyLessonListPage({Key key, this.title}) : super(key: key);

  

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),backgroundColor: Color(0xff9c27b0)),
      
      //body: Center(child: Text('This app is basically for university students. \n They can work with the app and improve your English skills')),
      drawer: Drawer(
      
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Helloo!!' ,style: TextStyle(fontSize: 30, color: Colors.white)),
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
      //  body: Container(
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
               
      //         //  Text('Welcome to Learn English',style: TextStyle(fontWeight: FontWeight.bold, 
      //         //  color: Colors.green,
                
      //         //  fontSize: 20),
               
            
      //           //style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
      //         // ),
      //         RaisedButton(
      //           child: Text("Save your data", 
      //           style: TextStyle(fontSize: 20),),
      //           textColor: Colors.white,
               
      //           color: Colors.green,
      //           padding: EdgeInsets.all(50),
      //           onPressed: () {
                 
      //               Firestore.instance.collection("introduction").add(
      //               {
      //                 "name" : "john",
      //                 "age" : 50,
      //                 "email" : "example@example.com",
      //                 "address" : {
      //                   "street" : "street 24",
      //                   "city" : "new york"
      //                 }
      //               }).then((value){
      //                 print(value.documentID);
      //               });

      //           }

      //           //color: Colors.red,
      //           //textColor: Colors.yellow,
      //           // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      //           // splashColor: Colors.grey,
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      
      body: StreamBuilder(
        
        stream: Firestore.instance.collection("introduction").snapshots(),
        builder: (context, snapshot){
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.separated(  
            // padding: EdgeInsets.all(50),
            padding: const EdgeInsets.only(top: 20,bottom: 50,left: 20,right: 20),
            
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context,index){
              DocumentSnapshot task = snapshot.data.documents[index];
              
              return Column(
                
                children: <Widget>[
                  // Padding(
                  // padding: const EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20)
                  // ),
                  Text(snapshot.data.documents[0]["text"],style: TextStyle(
                    fontSize: 35,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold, 
                    color: Colors.purple, 
                     )
                  ),
                  Text(snapshot.data.documents[0]["description"],style: TextStyle(
                    fontSize: 25,
                    // fontStyle: FontStyle.italic,
                    color: Colors.purple, 
                    ),
                  ),
                  // Text(snapshot.data.documents[0]["title"],style: TextStyle(
                  //   fontSize: 25,
                  //   color: Colors.black,
                  //   fontWeight: FontWeight.bold, 
                  //   )
                  // ),
                  RaisedButton(
                    child: Text("Now let's start with a small task.", 
                    style: TextStyle(fontSize: 20),),
                    textColor: Colors.white,
                  
                    color: Color(0xffab47bc),
                    padding: EdgeInsets.all(50),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Vocabulory()),
                      );
                    },
                  ),
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
                        // Text(snapshot.data.documents[0]["taskTitle"],style: TextStyle(
                  //   fontSize: 15,
                  //   color: Colors.black,
                  //   fontWeight: FontWeight.bold, 
                  //   )),
                ],
              ) ;   
                  // return ListTile(
                  //   title: Text(task["description"]),
                  //   subtitle: Text(task["taskTitle"]),
                    
                  // );
            }, separatorBuilder: (BuildContext context, int index) => const Divider(),
          );
          // if (!snapshot.hasData) return Text('Loading...');   
          // return Column(
          //   children: <Widget>[
          //     Text(snapshot.data.documents[0]["taskId"].toString())
          //   ],
          // ) ;    
        }
      ),
    );
  }
  
}

class AboutDetailPage extends StatefulWidget {
  //final DocumentSnapshot flower;
  //DetailPage({this.flower});

  @override
  _AboutDetailPageState createState() => _AboutDetailPageState();
}

class _AboutDetailPageState extends State<AboutDetailPage> {
double screenHeight;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return new Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        backgroundColor: Color.fromRGBO(61, 212, 125, 100),
        title: Row(
          children: <Widget>[
            SizedBox(
              width: 15,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
                child: CircleAvatar(
                  backgroundImage: ExactAssetImage('images/logo.png'),
                  radius: 25.0,
                ),
                decoration: new BoxDecoration(
                  border: new Border.all(
                    color: Colors.pink,
                    width: 1.0,
                  ),
                  borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                )),
            Container(
              //margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'EnlishApp',
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
                        Text('About English App',
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
      body: ListView(
        children: <Widget>[
          SizedBox(height: 18.0),
          ListTile(
              title: Text(
                  'FlowerSnap - A mobile application to learn about flowers')),
          SizedBox(height: 18.0),
          ListTile(
            title: Text(
                'FlowerSnap consolidates a list of flowers along with flower names, a brief description, a photo, and some guidance for those of you who are interested in gardening.'),
          ),
          ListTile(
            title: Text('Logged-in users can:'),
          ),
          ListTile(
            leading: Icon(
              Icons.local_florist,
              color: Color.fromRGBO(61, 212, 125, 100),
            ),
            title: Text('View a list of available flower details'),
          ),
          ListTile(
            leading: Icon(
              Icons.share,
              color: Color.fromRGBO(61, 212, 125, 100),
            ),
            title: Text('Share flower details'),
          ),
          ListTile(
            leading: Icon(
              Icons.language,
              color: Color.fromRGBO(61, 212, 125, 100),
            ),
            title:
                Text('Browse for further details using suggested references'),
          ),
          ListTile(
            leading: Icon(
              Icons.add,
              color: Color.fromRGBO(61, 212, 125, 100),
            ),
            title: Text('Add an entry to the application'),
          ),
          ListTile(
            leading: Icon(
              Icons.update,
              color: Color.fromRGBO(61, 212, 125, 100),
            ),
            title: Text('Update an entry uploaded by them'),
          ),
          ListTile(
            leading: Icon(
              Icons.delete,
              color: Color.fromRGBO(61, 212, 125, 100),
            ),
            title: Text('Remove an entry uploaded by them'),
          ),
          ListTile(
            leading: Icon(
              Icons.search,
              color: Color.fromRGBO(61, 212, 125, 100),
            ),
            title: Text('Search for flower details'),
          ),
        ],
      ),
    );
  }
}
