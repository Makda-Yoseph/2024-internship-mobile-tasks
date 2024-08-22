import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:myapp/features/product/Domain/entities/product.dart';
import 'package:myapp/features/product/presentation/blocks/Home_blocks/home_block.dart';
import 'package:myapp/features/product/presentation/blocks/Home_blocks/home_event.dart';
import 'package:myapp/features/product/presentation/blocks/Home_blocks/home_state.dart';
import 'package:myapp/service_locator.dart';
import 'package:myapp/src/detail.dart';
import 'package:myapp/src/products.dart';
import 'package:myapp/src/update.dart';
import 'package:myapp/src/search.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:google_fonts/google_fonts.dart';
// class App extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {

//      List<Item> shoes = ItemProvider.retrive();
//     List<Widget> dispCards = shoes.map((shoe){
//       return Mycard(shoes:shoe);
//     }).toList();
      

//     return MaterialApp( 
//       home: HomeScreen(),
//     );
//   }
// }
class HomeScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomeScreen> {
   var name;

  void initState() {
    super.initState();
    _loadName();
  }
  Future<void> _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('auth_name');
    });
    // print(name.toString());
  }
  
  Widget build(BuildContext context) {
    String currentDate = DateFormat('MMMM dd, yyyy').format(DateTime.now());

    // List<Item> shoes = ItemProvider.retrive();
    // List<Widget> dispCards = shoes.map((shoe){
    //   return Mycard(shoes:shoe);
    // }).toList();
    // BlocProvider.of<HomeBloc>(context).add(ImageFetch());
      // return BlocProvider(
      //   create: (context) {
      //   final homeBloc = getIt<HomeBloc>();
      //   homeBloc.add(ImageFetch()); 
      //   return homeBloc;
      // },
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/detail');
            },
            child: Icon(Icons.add),
            shape: CircleBorder(),
            backgroundColor:Color.fromRGBO(63, 81, 243, 1),
            foregroundColor: Colors.white,
          ),
          appBar: AppBar(
            actions: [
              Row(
                children: [
                   Container(
                  child: IconButton(
                    icon: Icon(Icons.circle_notifications, color: Colors.grey),
                    onPressed: () {},
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(Icons.logout, color: Colors.grey.shade600),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                  ),
                ),
                ],

                
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
            title:  SizedBox(
              child: Column(
                children: <Widget>[
                  Text(currentDate,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      )),
                  Text(
                    'Hello ${name.toString()}'
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
                child: BlocBuilder<HomeBloc, ImageState>(
                  builder: (context, state) {
                    if (state is ImageLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is ImageLoadFailState) {
                      return Center(child: Text('Failed to load products.'));
                    } else if (state is ImageLoaded) {
                      return ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          final product = state.items[index];
                          return Mycard(shoes: product);
                        },
                      );
                    }
                    return Center(child: Text('Unexpected state.'));
                  },
                ),
              ),
              ],
            ),
          ),
        
      );
    
  }
}

class Mycard extends StatelessWidget {
  final product shoes;

  Mycard({super.key, required this.shoes});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 150,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/update', arguments: shoes);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  shoes.imageUrl, 
                  fit: BoxFit.fill,
                  alignment: Alignment.centerLeft,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      shoes.name,
                      style: TextStyle(
                        color: Color.fromRGBO(62, 62, 62, 1),
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      '\$${shoes.price.toString()}',
                      style: TextStyle(
                        color: Color.fromRGBO(62, 62, 62, 1),
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      ' ', 
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(170, 170, 170, 1),
                      ),
                    ),
                  ),
                  Row(
                   
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.yellow),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          '4.8', // Replace with actual rating if needed
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(170, 170, 170, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
