import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zetian/providers/authentication_provider.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin{

  var username;
  var token;
  var role;
  var id;
  var v;

  void initState(){
    super.initState();
    getSavedLogin();
  }

  // Call the SharedPreference function and populate the Authentication Provider with setStartInfo function
  // Function waits for 3 seconds before pushing the next page depending on outcome.
  void getSavedLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
      token = prefs.getString('token');
      role = prefs.getString('role');
      id = prefs.getString('id');
      v = prefs.getInt('v');
    });
    if (username != null && token != null && role != null && id != null && v != null) {
      Provider.of<AuthenticationProvider>(context, listen: false).setStartInfo(username, token, id, role, v);
      Timer(Duration(seconds: 3), (){
        Navigator.pushReplacementNamed(context, '/dashboard');
      });
    }
    else {
      print("email was null");
      Timer(Duration(seconds: 3), (){
        Navigator.pushReplacementNamed(context, '/login');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/Zetian.png'),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: ProgressIndicatorDemo()
          )
        ],
      ),
    );
  }
}

class ProgressIndicatorDemo extends StatefulWidget {

  @override
  _ProgressIndicatorDemoState createState() =>
      new _ProgressIndicatorDemoState();
}

class _ProgressIndicatorDemoState extends State<ProgressIndicatorDemo>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller!)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller!.repeat();
  }


  @override
  void dispose() {
    controller!.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
          child:  LinearProgressIndicator(
            color: Colors.white,
            backgroundColor: Colors.white38,
            value:  animation!.value,
          ),

        )
    );
  }

}