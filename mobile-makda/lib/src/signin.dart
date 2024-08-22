import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/product/Authorization/PresentationLayer/blocks/signin_blocks/signin.state.dart';
import 'package:myapp/features/product/Authorization/PresentationLayer/blocks/signin_blocks/signin_blocks.dart';
import 'package:myapp/features/product/Authorization/PresentationLayer/blocks/signin_blocks/signin_event.dart';

class Signinpage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // Show success snackbar and navigate to home screen
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Sign in successful!'),
                backgroundColor: Colors.green,
              ),
              
            );
            Navigator.pushNamed(context, '/homescreen');
          } else if (state is AuthenticationFailed) { 
            // Show failure snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 99),
            child: Column(
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Color.fromRGBO(63, 81, 243, 1)),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Text(
                    'ECOM',
                    style: GoogleFonts.caveatBrush(
                      color: Color.fromRGBO(63, 81, 243, 1),
                      fontSize: 36,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Sign into your account',
                  style: GoogleFonts.poppins(
                    fontSize: 27,
                  ),
                ),
                SizedBox(height: 20),
                buildTextField('Email', _emailController, 'ex: jon.smith@email.com',false),
                SizedBox(height: 20),
                buildTextField('Password', _passwordController, '*********',true),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    
                    context.read<SigninBloc>().add(SigninButtonPressed(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(63, 81, 243, 1),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'SIGN IN',
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
                  ),
                ),
                SizedBox(height: 100),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don’t have an account?',
                          style: GoogleFonts.poppins(
                            color: Color.fromRGBO(136, 136, 136, 1),
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          'SIGN UP',
                          style: GoogleFonts.poppins(
                            color: Color.fromRGBO(63, 81, 243, 1),
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
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
            obscureText: val,
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
