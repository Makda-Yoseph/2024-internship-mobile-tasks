import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/product/Authorization/DomainLayer/entites/userregister.dart';
import 'package:myapp/features/product/Authorization/PresentationLayer/blocks/signup_blocks/user_bloc.dart';
import 'package:myapp/features/product/Authorization/PresentationLayer/blocks/signup_blocks/user_event.dart';
import 'package:myapp/features/product/Authorization/PresentationLayer/blocks/signup_blocks/user_state.dart';
class Signuppage extends StatefulWidget {
  @override
  _SignuppageState createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          
          Row(
            children: [
              
              Padding(
              padding: EdgeInsets.only(top: 10,left: 50),
              child: Container(
                // padding: EdgeInsets.only(top: 20,right: 20),
                      width: 70,
                      // height: 0,
                      decoration: BoxDecoration(
                        // padding:EdgeInsets.only(value),
                        shape: BoxShape.rectangle,
                         border: Border.all(color: Color.fromRGBO(63, 81, 243, 1)),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                
                      ),
                      child:Text('ECOM',style: GoogleFonts.caveatBrush(
                        color: Color.fromRGBO(63, 81, 243, 1),
                        fontSize: 23
                      ),
                      textAlign: TextAlign.center,
                      )
                    ),
            ),
            SizedBox(width: 15,)

            ],
            
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.only(left: 11),
          child: IconButton(
            onPressed: () {
              // Navigator.pop(context);
              Navigator.pushNamed(context, '/signin');
            },
            icon: Icon(Icons.chevron_left,
                color: Color.fromRGBO(63, 81, 243, 1)),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is Autenticated) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Sign Up Successful!'),backgroundColor:Colors.green.shade200),
                
              );
             Navigator.pushNamed(context, '/signin');
            } else if (state is AutenticateFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error),backgroundColor: Colors.red.shade300,),
              );
            } else if (state is Autenticating) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Signing Up...')),
              );
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Create your account',
                  style: GoogleFonts.poppins(fontSize: 27),
                  textAlign: TextAlign.center,
                ),
                buildTextField('Name', _nameController, 'ex: Jon Smith',false),
                SizedBox(height: 15),
                buildTextField('Email', _emailController,
                    'ex:jon.smith@email.com',false),
                SizedBox(height: 15),
                buildTextField('Password', _passwordController, '*********',true),
                SizedBox(height: 15),
                buildTextField('Confirm Password', _confirmPassword, '*********',true),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                           setState(() {
                              _isChecked = !_isChecked; // Toggle the state
                            });
                        },
                        icon: Icon(
                           _isChecked ? Icons.check_box_outlined : Icons.check_box_outline_blank_sharp,
                        ),
                      ),
                      Text(
                        'I understood the terms & policy.',
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'terms & policy.',
                          style: GoogleFonts.poppins(
                              color: Color.fromRGBO(63, 81, 243, 1),
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final userData = UserRegisterInfo(
                      name: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    if  (_passwordController.text != _confirmPassword.text) {
                       ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Password not correctly confirmed'),backgroundColor: Colors.red.shade300,),
              );
                    }else {context.read<UserBloc>().add(Register(userdata: userData));}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(63, 81, 243, 1),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'SIGN UP',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: 15),
                  ),
                ),
                SizedBox(height: 50),
                SizedBox(height: 50),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Have an account?',
                        style: GoogleFonts.poppins(fontSize: 16)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,  '/signin');
                      },
                      child: Text(
                        ' SIGN IN',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Color.fromRGBO(63, 81, 243, 1)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, String hint,bool val,
      {bool isPrice = false, bool isDescription = false}) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextField(
            obscureText:val ,
            controller: controller,
            keyboardType: isPrice ? TextInputType.number : TextInputType.text,
            maxLines: isDescription ? 6 : 1,
            decoration: InputDecoration(
              suffixIcon: isPrice ? Icon(Icons.attach_money) : null,
              border: InputBorder.none,
              hintText: hint,
              fillColor: Color.fromARGB(12, 27, 23, 23),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}
