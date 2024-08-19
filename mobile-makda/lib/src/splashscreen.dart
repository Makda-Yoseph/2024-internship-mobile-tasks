
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget{
  SplashScreen({super.key});
  @override
  State<SplashScreen>createState()=>SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
     Future.delayed(Duration(seconds:2));(){
        Navigator.pushNamed(context, '/');
  };
  }
  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays:SystemUiOverlay.values);
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.blue.shade800],
            begin:Alignment.topCenter,
            end: Alignment.bottomRight
            )
        ),
        child: Container(
          width: 264,
          height: 121,
          child: Column(
            children: [
              Text('ECOM',style: GoogleFonts.caveatBrush(
                  color: Colors.blue.shade800,  
                  fontSize: 36, 
                ),),
                Text('Ecommerce APP',style: GoogleFonts.poppins(color:Colors.white,fontSize: 36),)
                ],
            
          ),
        ),
      ),
    );
  }
}