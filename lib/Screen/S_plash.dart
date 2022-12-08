import 'package:flutter/material.dart';
import 'package:untitled/Screen/choose.dart';


class Splash_Page extends StatefulWidget {
  const Splash_Page({Key? key}) : super(key: key);

  @override
  State<Splash_Page> createState() => _Splash_PageState();
}

class _Splash_PageState extends State<Splash_Page> {
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(Duration(seconds: 3),()
     {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChoosePage(),));
    },
    );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          image:DecorationImage(image: AssetImage("Img/helpimg.jpg"),fit: BoxFit.fill),
        ),
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Welcome to",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900,backgroundColor: Colors.black54,color: Colors.pinkAccent[200]), ),
              Text("Hellping",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900,backgroundColor: Colors.black54,color: Colors.pinkAccent[200]), )
              ,Text("POOR",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900,backgroundColor: Colors.black54,color: Colors.pinkAccent[200]), )
            ],
          ),
        ),
      ),
    );
  }
}
