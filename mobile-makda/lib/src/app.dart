import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/src/detail.dart';
import 'package:myapp/src/products.dart';
import 'package:myapp/src/update.dart';
import 'package:myapp/src/search.dart';
import 'package:provider/provider.dart';
// import 'package:google_fonts/google_fonts.dart';
class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

     List<Item> shoes = ItemProvider.retrive();
    List<Widget> dispCards = shoes.map((shoe){
      return Mycard(shoes:shoe);
    }).toList();
      

    return MaterialApp( 
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {

    List<Item> shoes = ItemProvider.retrive();
    List<Widget> dispCards = shoes.map((shoe){
      return Mycard(shoes:shoe);
    }).toList();
      
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/detail');
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
                      Navigator.pushNamed(context, '/search');
                        
                    },
                    icon: const Icon(Icons.search),
                    color: Colors.grey,
                  )
                ],
              ),
              Expanded(
                child:ListView(
                  children: dispCards,
                )
              ),
            ],
          ),
        ),
      );
    
  }
}

class Mycard extends StatelessWidget {
  Item shoes ;
   Mycard({super.key,required this.shoes});

  @override
  Widget build(BuildContext context) {
   
    return Card(

      child: Padding(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: GestureDetector(
        
          onTap: (){
            Navigator.pushNamed(context, '/update');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                
                borderRadius: BorderRadius.circular(15),
                child:  Image.file(
            
                  
                shoes.imgpath!,
                  fit:BoxFit.fill,
                  alignment: Alignment.centerLeft,
                ),
              ),
               SizedBox(height: 20),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left:10),
                    child:  Text(shoes.name!, style: TextStyle(color:const Color.fromRGBO(62, 62, 62, 1),fontSize: 22))),
                  Padding(
                    padding:EdgeInsets.only(right: 10),
                    child: Text(
                      shoes.price!,
                      style: TextStyle(color:const Color.fromRGBO(62, 62, 62, 1),fontSize: 22)
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left:10),
                    child:  Text(shoes.category!,style: TextStyle(fontSize: 15,color:const Color.fromRGBO(170, 170, 170, 1)),)
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
