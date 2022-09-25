import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../firebase_automation.dart';
import '../provider/managers.dart';
import '../theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passController;
  late String userType;

  List<String> userTypes = ['Teacher', 'Student'];
  bool isObscure = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    userType = userTypes[0];
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          SizedBox(height: 10),
          Text(
            'unSCRAWL',
            style: appTitle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                buildEmailField(),
                SizedBox(height: 20),
                buildPasswordField(),
                SizedBox(height: 20),
                buildRadioFields(),
                SizedBox(height: 20),
                SizedBox(width: double.infinity, child: buildLoginButton()),
                Align(
                  alignment: Alignment.centerRight,
                  child: buildForgotButton(),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Image.asset(
            'assets/images/login.png',
          )
        ],
      ),
    );
  }

  TextButton buildForgotButton() {
    return TextButton(
      style: ButtonStyle(alignment: Alignment.centerRight),
      onPressed: () async {
        await firebaseAutomation();
      },
      child: Text(
        'Forgot Password?',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  ElevatedButton buildLoginButton() {
    return ElevatedButton(
      onPressed: () async {
        await Provider.of<LoginManager>(context, listen: false).login(
          emailController.text.toString(),
          passController.text.toString(),
          userType,
          context,
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xfff7b6a7)),
      ),
      child: Text(
        'Log in',
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  }

  TextField buildPasswordField() {
    return TextField(
      obscureText: isObscure,
      cursorColor: Colors.black,
      controller: passController,
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.white,
        hintText: 'Password',
        hintStyle: TextStyle(fontFamily: 'voll'),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
        ),
      ),
    );
  }

  TextField buildEmailField() {
    return TextField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        decoration: const InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(fontFamily: 'voll'),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
        ));
  }

  Widget buildRadioFields() => Row(
        children: [
          Radio(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: Colors.black,
            value: 'Teacher',
            groupValue: userType,
            onChanged: (value) => setState(() => userType = value as String),
          ),
          Text('Teacher'),
          SizedBox(width: 30),
          Radio(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: Colors.black,
            value: 'Student',
            groupValue: userType,
            onChanged: (value) => setState(() => userType = value as String),
          ),
          Text('Student'),
        ],
      );
}
