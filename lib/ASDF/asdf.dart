import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectno2/PoorNeed/Individualpoor/Individualpoor.dart';

class Clickeddistrict_Page extends StatefulWidget {
   Clickeddistrict_Page({Key? key,required this.Districtname}) : super(key: key);
final String Districtname;
  @override
  State<Clickeddistrict_Page> createState() => _Clickeddistrict_PageState();
}

class _Clickeddistrict_PageState extends State<Clickeddistrict_Page> {


  @override
  Widget build(BuildContext context) {


    Future<void> deleteUser() {
      CollectionReference users = FirebaseFirestore.instance.collection('${widget.Districtname}');
      return users
          .doc()
          .delete()
          .then((value) => print("User Deleted"))
          .catchError((error) => print("Failed to delete user: $error"));
    }

    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('${widget.Districtname}').snapshots();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        Individual_Page(


                          description: data["aboutyourself"],
                          name: data["name"],
                          number: data["imonumber"],
                          occupation:data["occupation"] ,
                          img: "Img/poorhelp.jpg",

                    )));
                  },
                  child: Container(
                    margin: EdgeInsets.all(
                      20
                    ),

                    decoration: BoxDecoration(
                      color: Colors.pinkAccent[100],
                      borderRadius:BorderRadius.circular(15),

                    ),
                    height: 130,
                    width: double.infinity,
                    child: Row(
                      children: [
                     Expanded(
                         flex: 2,
                         child: Center(
                           child: Column(
                             children: [    Container(
                               padding: EdgeInsets.all(5),
                               height: 40,
                               color: Colors.yellow,
                               alignment: Alignment.center,
                               child: Text(data["name"],textAlign:TextAlign.center ,style: TextStyle(

                               ),),
                             ),
                               Container(
                                 width: 100,
                                 height: 87,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(image: AssetImage("Img/poorhelp.jpg"),fit: BoxFit.fill),
                                 ),
                               ),

                             ],
                           ),
                         ),
                     ),
                     Expanded(
                         flex: 3,
                         child: Container(
                           width: 100,
                           padding: EdgeInsets.all(5),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Expanded(flex: 1,child: Container(
                               alignment: Alignment.center,
                               child: Text(data["district"]),
                             ),),
                               Expanded(flex: 1,child: Container(
                                 margin: EdgeInsets.only(left: 20),
                                 child: Text(data["occupation"]),
                               ),),

                               Expanded(flex: 1,child: Container(
                                 margin: EdgeInsets.only(left: 20),
                                 child: Text(data["imonumber"]),
                               ),),


                             ],
                           ),
                         )),
                     Expanded(
                         flex: 3,
                         child: Stack(
                           children: [
                             Container(
                               padding: EdgeInsets.all(5),
                               width: 100,
                               alignment: Alignment.topLeft,
                               child: SingleChildScrollView(
                                   scrollDirection: Axis.vertical,
                                   child: Text(data["aboutyourself"])),
                             ),

                             Positioned(
                                  bottom: 0,
                                 right: 0,
                                 child:   ElevatedButton(onPressed: (){
                               FirebaseFirestore.instance.collection('${widget.Districtname}').doc(document.id).delete();

                             }, child: Text("Delete")))
                           ],
                         )),

                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
