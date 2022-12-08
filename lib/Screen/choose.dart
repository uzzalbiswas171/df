import 'package:flutter/material.dart';
import 'package:untitled/Helper/DistrictList/districtlis.dart';

import 'package:untitled/PoorNeed/poorneed.dart';

class ChoosePage extends StatefulWidget {
  const ChoosePage({Key? key}) : super(key: key);

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => Need_Poor_Page(),));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image:DecorationImage(image: AssetImage("Img/poorhelp.jpg"),fit: BoxFit.fill),
                  ),
                  padding: EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("You need",style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 44,
                          color:
                          Colors.white,
                          backgroundColor: Colors.white54,
                        ),),
                        Text("HELP",style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 44,
                          color: Colors.white,
                          backgroundColor: Colors.white54,

                        ),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DistrictListPage(),));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image:DecorationImage(image: AssetImage("Img/helper.jpg"),fit: BoxFit.fill),
                  ),

                  padding: EdgeInsets.only(
                    bottom: 20,                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("You will give ",style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 44,
                          backgroundColor: Colors.white54,
                        ),),
                        Text("Hand",style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize:44,
                          backgroundColor: Colors.white54,
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
