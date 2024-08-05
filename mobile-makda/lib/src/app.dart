import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/src/detail.dart';
import 'package:myapp/src/update.dart';
import 'package:myapp/src/search.dart';
// import 'package:google_fonts/google_fonts.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Ensuring the app is wrapped in a MaterialApp
      home: HomeScreen(), // Setting the HomeScreen as the home widget
    );
  }
}

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => Detail()),
);
          },
          child: Icon(Icons.add),
          shape: CircleBorder(),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        appBar: AppBar(
          actions: [
            Container(
              child: IconButton(
                icon: Icon(Icons.circle_notifications, color: Colors.grey),
                onPressed: () {},
              ),
            )
          ],
          leading: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
            child: Container(
              width: 700,
              height: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.00),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/profile.jpg',
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          title: const SizedBox(
            child: Column(
              children: <Widget>[
                Text('july 14 ,2023',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    )),
                Text(
                  'Hello, Abeba',
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Text('Available Products',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 41, 39, 39),
                      )),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Search ()),
                        );
                    },
                    icon: const Icon(Icons.search),
                    color: Colors.grey,
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Mycard(),
                    SizedBox(
                      height: 10,
                    ),
                    Mycard(),
                    SizedBox(
                      height: 10,
                    ),
                    Mycard(),
                    SizedBox(
                      height: 10,
                    ),
                    Mycard(),
                    SizedBox(
                      height: 10,
                    ),
                    Mycard(),
                    SizedBox(
                      height: 10,
                    ),
                    Mycard(),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Mycard extends StatelessWidget {
  const Mycard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: GestureDetector(
        
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Update()),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                
                borderRadius: BorderRadius.circular(15),
                child: const Image(
                  width:double.infinity,
                  image: AssetImage('assets/boot.jpg'),
                  fit:BoxFit.fill,
                  alignment: Alignment.centerLeft,
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left:10),
                    child: const Text('summer shoes', style: TextStyle(color:const Color.fromRGBO(62, 62, 62, 1),fontSize: 22))),
                  Padding(
                    padding:EdgeInsets.only(right: 10),
                    child: Text(
                      '\$120',
                      style: TextStyle(color:const Color.fromRGBO(62, 62, 62, 1),fontSize: 22)
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left:10),
                    child: const Text('best shoes ',style: TextStyle(fontSize: 15,color:const Color.fromRGBO(170, 170, 170, 1)),)
                    ),
                  Row(
                    children: <Widget>[
                    Icon(Icons.star, color: Colors.yellow),
                    Padding(
                      padding: EdgeInsets.only(right:10),
                      child: Text(
                        '4.8',
                        style: TextStyle(fontSize: 15,color:const Color.fromRGBO(170, 170, 170, 1)) ,
                      ),
                    ),
                  ]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
