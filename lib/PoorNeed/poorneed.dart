import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ASDF/asdf.dart';
import 'package:untitled/PoorNeed/Afterpoorlogin/afterpoorlogin.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class Need_Poor_Page extends StatefulWidget {
  const Need_Poor_Page({Key? key}) : super(key: key);
  @override
  State<Need_Poor_Page> createState() => _Need_Poor_PageState();
}

class _Need_Poor_PageState extends State<Need_Poor_Page> {

  int selectedindex=0;
  List DistrictListEnglish=[
    "Chittagong",
    "Dhaka",
    "Rajshahi",
    "Sylhet",
    "Mymensingh",
    "Barisal",
    "Rangpur",
    "Khulna",
    "Jessore",
    "Dinajpur",
    "Comilla",
    "Faridpur",
    "Bogra",
    "Pabna",
    "Rangamati",
    "Kushtia",
    "Noakhali",
    "Tangail",
    "Panchagarh",
    "Bhola",
    "Bandarban",
    "Chandpur",
    "Habiganj",
    "Lakshmipur",
    "Barguna",
    "Jhalokati",
    "Pirojpur",
    "Patuakhali",
    "Jhenaidah",
    "Narail",
    "Magura",
    "Lalmonirhat",
    "Kurigram",
    "Nilphamari",
    "Gaibandha",
    "Thakurgaon",
    "Satkhira",
    "Bagerhat",
    "Chuadanga",
    "Meherpur",
    "Sirajganj",
    "Joypurhat",
    "Natore",
    "Naogaon",
    "Nawabganj",
    "Khagrachhari",
    "Feni",
    "Brahmanbaria",
    "Sunamganj",
    "Cox's Bazar",
    "Moulvibazar",
    "Gopalganj",
    "Shariatpur",
    "Madaripur",
    "Rajbari",
    "Gazipur",
    "Kishoreganj ",
    "Jamalpur",
    "Sherpur",
    "Netrakona",
    "Munshiganj",
    "Narsingdi",
    "Narayanganj",
    "Manikganj",

  ];
  List DistrictListbangla=[
    "চট্টগ্রাম",
    "ঢাকা",
    "রাজশাহী",
    "সিলেট",
    "ময়মনসিংহ",
    "বরিশাল",
    "রংপুর",
    "খুলনা",
    "যশোর",
    "দিনাজপুর",
    "কুমিল্লা",
    "ফরিদপুর",
    "বগুড়া",
    "পাবনা",
    "রাঙ্গামাটি",
    "কুষ্টিয়া",
    "নোয়াখালী",
    "টাঙ্গাইল",
    "পঞ্চগড়",
    "ভোলা",
    "বান্দরবান",
    "চাঁদপুর",
    "হবিগঞ্জ",
    "লক্ষীপুর",
    "বরগুনা",
    "ঝালকাঠি",
    "পিরোজপুর",
    "পটুয়াখালী",
    "ঝিনাইদহ",
    "নড়াইল",
    "মাগুরা",
    "লালমনিরহাট",
    "কুড়িগ্রাম",
    "নীলফামারী",
    "গাইবান্ধা",
    "ঠাকুরগাঁ",
    "সাতক্ষিরা",
    "বাগেরহাট",
    "চুয়াডাঙ্গা",
    "মেহেরপুর",
    "সিরাজগঞ্জ",
    "জয়পুরহাট",
    "নাটোর",
    "নওগাঁ",
    "নওয়াবগঞ্জ",
    "খাগড়াছড়ি",
    "ফেনী",
    "ব্রাহ্মণবাড়ীয়া",
    "সুনামগঞ্জ",
    "কক্সবাজার",
    "মৌলভীবাজার",
    "গোপালগঞ্জ",
    "শরীয়তপুর",
    "মাদারীপুর",
    "রাজবাড়ী",
    "গাজীপুর",
    "কিশোরগঞ্জ",
    "জামালপুর",
    "শেরপুর",
    "নেত্রকোনা",
    "মুন্সীগঞ্জ",
    "নরসিংদী",
    "নারায়ণগঞ্জ",
    "মানিকগঞ্জ",

  ];

  XFile ? _courseImage;
  chooseImage()async{
    ImagePicker ? _picker = ImagePicker();
    _courseImage=await _picker.pickImage(source: ImageSource.gallery);
     setState(() {

     });
  }

  TextEditingController _nameController=TextEditingController();
  TextEditingController _occupationController=TextEditingController();
  TextEditingController _numberController=TextEditingController();
  TextEditingController _aboutyourselfController=TextEditingController();
  TextEditingController _SubdistrictController=TextEditingController();
  String ? district;
  //
  // addUser() {
  //   CollectionReference users = FirebaseFirestore.instance.collection('${district}');
  //    users.add({
  //     'name': _nameController.text, // John Doe
  //     'occupation': _occupationController.text, // Stokes and Sons
  //     'imonumber': _numberController.text ,// 42
  //     'district': district,// 42
  //     'aboutyourself': _aboutyourselfController.text,// 42
  //     'subdistrict': _aboutyourselfController.text,// 42
  //
  //   });
  // }
  //


  String? _imageUrl;

  writeData() async {
    File _imageFile = File(_courseImage!.path);
    FirebaseStorage _storage = FirebaseStorage.instance;
    UploadTask _uploadTask =
    _storage.ref("{$district}").child(_courseImage!.name).putFile(_imageFile);
    TaskSnapshot snapshot = await _uploadTask;
    _imageUrl = await snapshot.ref.getDownloadURL();
    CollectionReference users = FirebaseFirestore.instance.collection('${district}');
    users.add({
      'name': _nameController.text, // John Doe
      'occupation': _occupationController.text, // Stokes and Sons
      'imonumber': _numberController.text ,// 42
      'district': district,// 42
      'aboutyourself': _aboutyourselfController.text,// 42
      'subdistrict': _SubdistrictController.text,// 42
      'img': _imageUrl,

    });
  }












  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 8,
        centerTitle: true,
        title: Text("Login page", style: TextStyle(
          fontSize: 22,fontWeight: FontWeight.w600,
        ),),
      ),


      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.lightBlueAccent[100],
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.lightGreen,
                  margin: EdgeInsets.all(20),
                  child: Center(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _nameController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          hintText:"Enter your name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),

                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.lightGreen,
                  margin: EdgeInsets.all(20),
                  child: Center(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _occupationController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                        hintText:"Enter your occupation",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),

                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.lightGreen,
                  margin: EdgeInsets.all(20),
                  child: Center(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _numberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                        hintText:"Enter your imo number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),

                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.lightGreen,
                  margin: EdgeInsets.all(20),
                  child: Center(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _SubdistrictController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                        hintText:"Enter your SubDistrict",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),

                      ),
                    ),
                  ),
                ),
                Container(
                  height: 90,
                  width: double.infinity,
                  color: Colors.lightGreen,
                  margin: EdgeInsets.all(20),
                  child: Center(
                    child: TextFormField(
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _aboutyourselfController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                        hintText:"About yourself",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),

                      ),
                    ),
                  ),
                ),                 // about your selfe
                Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.lightGreen,
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 5,
                    bottom: 5
                  ),
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 64,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        crossAxisCount: 2,
                  ), itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {

                            district=DistrictListbangla[index];
                          selectedindex=index;
                        });

                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: selectedindex==index?Colors.blue[200] : Colors.amberAccent[200],
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${DistrictListEnglish[index]}", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                            SizedBox(height: 5,),
                            Text("${DistrictListbangla[index]}", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    );
                  },)
                ),                 //grig view
                Center(
                  child: InkWell(
                    onTap: () {
                      chooseImage();
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.lightGreen[200],
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: _courseImage==null? Icon(Icons.camera_alt_outlined,size: 32,):Image.file(File(_courseImage!.path),fit: BoxFit.fill,),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
     ///////////////////////////////////////////////////////////////////
                InkWell(
                  onTap: () {

                    if (_formKey.currentState!.validate()) {
                      writeData();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Clickeddistrict_Page(Districtname: '${district}',),));
                    }


                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    margin: EdgeInsets.all(
                      20,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red[300],
                    ),
                    child: Text("Submit",style: TextStyle(
                      fontSize: 22,fontWeight: FontWeight.w600
                    ),),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
