import 'package:flutter/material.dart';
import 'package:flutter_login_1/screens/home_screen.dart';
import 'package:flutter_login_1/screens/sigup_screen.dart';
import '../utils/color_utils.dart';
import '../reusable_widgets/reusable_widget.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => __SignInScreenState();
}

class __SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height *0.2, 20, 0),
            child: Column(
              children: <Widget> [
                logoWiget("assets/images/logo1.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false, _emailTextController),

                const SizedBox(
                  height: 30,
                ),

                reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),

                const SizedBox(
                  height: 20,
                ),
                singInSingnUpButton(context, true, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                }),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account? ",
              style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
          },

          child:const Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight:FontWeight.bold),),
        ),
      ],
    );
  }
}
