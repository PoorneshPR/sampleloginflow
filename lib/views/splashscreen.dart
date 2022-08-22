import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sampleauthroll/views/homescreen.dart';
import 'package:sampleauthroll/views/loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState(){
    _auth= FirebaseAuth.instance;
    user=_auth?.currentUser;
    isLoading=false;

  super.initState();
  }
  FirebaseAuth? _auth;
  User?user;
  bool isLoading=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Center(
      child: isLoading?Container(
        child: Center(child: CircularProgressIndicator(color:Colors.green )),
      ):user==null?LoginScreen():HomeScreen()
    ),);
  }
}
