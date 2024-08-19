

import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Signin extends StatefulWidget{
  Signin({super.key});
  @override
  // State<SplashScreen>createState()=>SplashScreenState();
  State<Signin>createState()=>Signinpage();
}

class Signinpage extends State<Signin>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(63, 81, 243, 1),

            ),
            child:Text('ECOM',style: GoogleFonts.caveatBrush(
              color: Color.fromRGBO(63, 81, 243, 1),
              fontSize: 36
            ),)
          ),

          Text('Sign into your account',style: GoogleFonts.poppins(
            fontSize: 27,
          ),),

          Column(
            children: [
              Text('Email'),
              TextField(
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(12, 27, 23, 23),
                  hintText: 'ex: jon.smith@email.com',
                ),
              )

            ],
          ),
          Column(
            children: [
              Text('Password'),
              TextField(
                decoration: InputDecoration(
                  hintText: '*********',
                  fillColor: Color.fromARGB(12, 27, 23, 23);
                ),
              )
            ],
          ),
          ElevatedButton(onPressed: (){},
           child: Text('SIGN IN',style: GoogleFonts.poppins(color: Colors.white),),
           style: ElevatedButton.styleFrom(
            backgroundColor:Color.fromRGBO(63, 81, 243, 1) ,
           ),
           ),
           Container(
            child: Row(
              children: [
                Text('Don’t have an account?',style: GoogleFonts.poppins(color:Color.fromRGBO(136, 136, 136, 1, ))),
                GestureDetector(
                  onTap: (){},
                  child: Text('SIGN UP',style: GoogleFonts.poppins(color:Color.fromRGBO(63, 81, 243, 1)  ,fontSize: 16),),
                )
              ],
            ),
           )

        ],
      ),
    );
  }

}