import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_quote/screen/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => Home()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,

      body:Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.white10,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )
        ),
        child:  Center(

          //Text area
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const  Text("Fun",

                style:TextStyle(fontSize: 30,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,


                ),
              ),
              //Text two Area
              Padding(
                padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
                child: Text("Quote",
                  style:TextStyle(fontSize: 30,

                    fontStyle: FontStyle.italic,
                    color: Colors.amber[500],
                  ),
                ),
              ),

            ],
          ),

        ),
      ),


    );
  }
}
