

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/ASDF/asdf.dart';
import 'package:untitled/Helper/DistrictList/helper_can_see.dart';

class DistrictListPage extends StatefulWidget {
  const DistrictListPage({Key? key}) : super(key: key);

  @override
  State<DistrictListPage> createState() => _DistrictListPageState();
}

class _DistrictListPageState extends State<DistrictListPage> {
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

  String ? bangladistrict;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Choose your District",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 23,),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back),)
      ),
      body: Container(
        height: double.infinity,
        width:double.infinity,
        color: Colors.blue[100],
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: DistrictListbangla.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,

          ),
          itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedindex=index;
                bangladistrict=DistrictListbangla[index];
              });
              // showDialog(context: context, builder: (context) {
              //   return Dialog(
              //     child:Text("you clicked ${DistrictListEnglish[index]} ${[index]}", style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
              //  );
              // },);

              Navigator.push(context, MaterialPageRoute(builder: (context) => Hepler_Can_See_Page(Districtname: "${bangladistrict}",

              ),));
            },
            child: Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
              color: selectedindex==index?Colors.blue[200] : Colors.amberAccent[200],
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${DistrictListEnglish[index]}", style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                  Text("${DistrictListbangla[index]}", style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                ],
              ),
            ),
          );
            },)
      )
    );
  }
}
