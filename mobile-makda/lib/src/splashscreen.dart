
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
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
     Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/signin');
      dispose();
    });
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
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/frontgirls.png'),
            fit: BoxFit.cover
            )
        ),
        child: Container(
          padding: EdgeInsets.only(top: 100),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ Color.fromRGBO(50, 70, 245, 0),Color.fromRGBO(48, 67, 236, 1)],
              begin:Alignment.topLeft,
              end: Alignment.bottomRight,
              )
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.only(left: 10,right: 10,top:100,bottom: 100),
              child: Column(
                children: [
                  SizedBox(
                    height: 111,
                  ),
                  Container(
                    width:200,
                    height: 115,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('ECOM',style: GoogleFonts.caveatBrush(
                        letterSpacing: 2.5,
                          color: Color.fromRGBO(63, 81, 243, 1),  
                          fontSize: 1000, 
                        ),
                        
                        textAlign: TextAlign.center,
                        ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    
                  ),
                    Text('Ecommerce APP',style: GoogleFonts.poppins(color:Colors.white,fontSize: 36),)
                    ],
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}