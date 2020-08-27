import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/login.dart';
import 'home.dart';
import 'about.dart';
import 'vocab2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'lessonList.dart';

//void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Vocabulory(),
//     );
//   }
// }

class Vocabulory extends StatelessWidget {
  const Vocabulory({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  final appTitle = 'Learn English - Vocabulory Tasks !! ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle, 
      home: MyVoabuloryPage(title: appTitle),
    );
  }
}
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
_signOut(BuildContext context) async {
  await _firebaseAuth.signOut();
  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
}


class MyVoabuloryPage extends StatelessWidget {

  //final firestoreInstance = Firestore.instance;
  final String title;

  MyVoabuloryPage({Key key, this.title}) : super(key: key);

  

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
        
        stream: Firestore.instance.collection("taskSet1").snapshots(),
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
                  Text(snapshot.data.documents[0]["title"],style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold, 
                    color: Colors.black, 
                     )
                  ),
                  Text(snapshot.data.documents[0]["description"],style: TextStyle(
                    fontSize: 25,
                    color: Colors.purple, 
                    ),
                  ),

                  Text("\n\n Are you done reading?? \n \nNow its your time to remember the difficult words that you found on the paragraph. \n\nStudy them and try to remember them with the meaning. \n\nonce you done, press DONE to go forward. ",
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, 
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    )
                  ),
                  // Text(snapshot.data.documents[0]["title"],style: TextStyle(
                  //   fontSize: 25,
                  //   color: Colors.black,
                  //   fontWeight: FontWeight.bold, 
                  //   )
                  // ),

                  RaisedButton(
                    child: Text("DONE", 
                    style: TextStyle(fontSize: 20),),
                    textColor: Colors.white,
                  
                    color: Color(0xffab47bc),
                    padding: EdgeInsets.all(30),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Vocab()),
                      );
                    }
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
                        MaterialPageRoute(builder: (context) => LessonList()),
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