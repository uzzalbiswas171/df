import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Individual_Page extends StatefulWidget {
  Individual_Page({Key? key,
    required this.name,
    required this.occupation,
    required this.number,
    required this.description,
    required this.img,}) : super(key: key);

  String ? name,occupation,number,img,description;

  @override
  State<Individual_Page> createState() => _Individual_PageState();
}

class _Individual_PageState extends State<Individual_Page> {
 TextEditingController _ammountcontroller=TextEditingController();
 TextEditingController _commentcontroller=TextEditingController();
 TextEditingController _isrealcontroller=TextEditingController();
 TextEditingController _nameController=TextEditingController();

 addUser() {
   CollectionReference users = FirebaseFirestore.instance.collection('${widget.number}');
   users.add({
     'amoubt': _ammountcontroller.text ,// 42
     'real': _isrealcontroller.text,// 42
     'name': _nameController.text,// 42_nameController


   });
 }
 final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('${widget.number}').snapshots();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Comment me",style: GoogleFonts.poppins(fontSize: 17,letterSpacing: 1),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
         showDialog(context: context, builder: (context) {

                return Dialog(
                  child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22),
                      )
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      right: 10,
                                    ),
                                    height: 49,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.blue[100],
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          topLeft: Radius.circular(15),
                                        )
                                    ),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      controller: _isrealcontroller,
                                      style: GoogleFonts.poppins(fontSize: 17,letterSpacing: 1),
                                      decoration: InputDecoration(
                                        hintText: "real or not",
                                        hintStyle: GoogleFonts.poppins(fontSize: 17,letterSpacing: 1),
                                      ),
                                    ),

                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.amberAccent[100],
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          topLeft: Radius.circular(15),
                                        )
                                    ),
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      right: 10,
                                    ),
                                    height: 49,
                                    width: double.infinity,

                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      style: GoogleFonts.poppins(fontSize: 17,letterSpacing: 1),
                                      controller: _ammountcontroller,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: "Enter your ammount",
                                        helperStyle: GoogleFonts.poppins(fontSize: 18),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      right: 10,
                                    ),
                                    height: 49,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.blue[100],
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          topLeft: Radius.circular(15),
                                        )
                                    ),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      controller: _nameController,
                                      style: GoogleFonts.poppins(fontSize: 17,letterSpacing: 1),
                                      decoration: InputDecoration(
                                        hintText: "Enter your name",
                                        hintStyle: GoogleFonts.poppins(fontSize: 17,letterSpacing: 1),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      InkWell(

                        onTap: () {

                          if(_formKey.currentState!.validate()){
                            addUser();
                            Navigator.pop(context);
                          }

                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Colors.pinkAccent[200],
                          ),
                          child: Text("Submit",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.w600),),
                        ),
                      ),
                    ],
                  ),
                ),
                );
         },);
      },child: Icon(Icons.add),),










      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: double.infinity,
                color: Colors.greenAccent[100],
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text("${widget.description}",style:GoogleFonts.poppins(fontSize: 17,letterSpacing: 1)),
                ),
              ),
            ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.pinkAccent[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )
                ),
                height: 70,
                width: double.infinity,

                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("${widget.img}"),
                    radius: 40,
                  ),
                  title: Text("${widget.name}",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                  subtitle: Text("${widget.occupation}",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                  trailing: Text("${widget.number}"),
                ),
              ),
                          Expanded(
              flex: 3,
              child:Container(
                width: double.infinity,
                color: Colors.amberAccent[100],                child: StreamBuilder<QuerySnapshot>(
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
                         
                        },
                        child: Container(
                          margin: EdgeInsets.all(
                              20
                          ),

                          decoration: BoxDecoration(
                            color: Colors.pinkAccent[100],
                            borderRadius:BorderRadius.circular(15),

                          ),
                          height: 80,
                          width: double.infinity,
                          child:ListTile(
                            title: Text(data["name"],style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
                            subtitle: Text(data["amoubt"],style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
                            trailing: Text(data["real"],style: GoogleFonts.poppins(fontSize: 18),),
                          )
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
