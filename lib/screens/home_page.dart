import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/screens/notification_page.dart';
import 'package:grocery_app/widgets/custom_chip.dart';
import 'package:grocery_app/widgets/custom_slider.dart';
import 'package:grocery_app/widgets/custom_slider2.dart';
import 'package:grocery_app/widgets/title_row.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  List<Map<String, dynamic>> images = [
    {
      "image": "assets/images/Group 23.png",
      "text": "Food Delivery",
      "isChip": true
    },
    {
      "image": "assets/images/medicine 1.png",
      "text": "Medicines",
      "isChip": true
    },
    {
      "image": "assets/images/Vector.png",
      "text": "Pet Supplies",
      "isChip": true
    },
    {"image": "assets/images/gift.png", "text": "Gifts", "isChip": false},
    {"image": "assets/images/Group (1).png", "text": "Meat", "isChip": false},
    {"image": "assets/images/Make Up.png", "text": "Cosmetic", "isChip": false},
    {
      "image": "assets/images/Group (2).png",
      "text": "Stationery",
      "isChip": false
    },
    {"image": "assets/images/Group 51.png", "text": "Stores", "isChip": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: const Color(0xffFFFFFF),
        leading: Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(
              "assets/icons/Vector.svg",
            )),
        title: Row(
          children: [
            Text(
              "ABCD, New Delhi",
              style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff323232)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: SvgPicture.asset(
                "assets/icons/back button.svg",
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(5, 15, 0, 15),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: const Color(0xffEEEEEE),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            "assets/icons/Vector (1).svg",
                          ),
                        ),
                        hintText: "Search for products/stores",
                        hintStyle: GoogleFonts.quicksand(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff969696)),
                      ),
                    ),
                  ),
                  Badge(
                    
                    label: Text(
                      "2",
                      style: GoogleFonts.roboto(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xffFFFFFF)),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const NotificationScreen();
                        },));
                      },
                      icon: SvgPicture.asset(
                        "assets/icons/Vector (2).svg",
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/Vector (3).svg",
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "What would you like to do today?",
                style: GoogleFonts.quicksand(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff323232)),
              ),
              SizedBox(
                  height: 200,
                  child: GridView.builder(
                    itemCount: images.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            height: 70,
                            width: 70,
                            child: Card(
                              child: images[index]["isChip"]
                                  ? Stack(
                                      alignment: Alignment.center,
                                      children: [
                                          Image.asset(images[index]["image"]!),
                                          const Align(
                                            alignment: Alignment.topRight,
                                            child: CustomChip(),
                                          ),
                                        ])
                                  : Image.asset(images[index]["image"]!),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              images[index]["text"]!,
                              style: GoogleFonts.quicksand(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff323232)),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      );
                    },
                  )),
              Center(
                child: TextButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/back button.svg",
                    ),
                    label: Text(
                      "More",
                      style: GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff06C25E)),
                    )),
              ),
              Text(
                "Top picks for you",
                style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff323232)),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: CustomSlider(
                    image:
                        'assets/images/Figma_Resources_2-removebg-preview 1.png',
                    itemCount: 3),
              ),
              const TitleRow(title: "Trending"),
              SizedBox(
                  height: 300,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    //scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 0.0),
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Image.asset("assets/images/TLD6iCOlyb0.png"),
                        title: FittedBox(
                          child: Text(
                            "Mithas Bhandar",
                            style: GoogleFonts.quicksand(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff323232)),
                          ),
                        ),
                        subtitle: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Sweets, North Indian",
                                style: GoogleFonts.quicksand(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff474747)),
                              ),
                              Text("(store location)  |  6.4 kms",
                                   style: GoogleFonts.quicksand(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff474747))),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/Vectorstar.svg",
                                  ),
                                  Text("4.1  |  45 mins",
                                       style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff474747))),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )),
              Text("Craze deals",
                  style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff323232))),
              const CustomSlider2(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Container(
                 // height: 88,
                 padding: const EdgeInsets.all(10),
                  width: 374,
                  decoration: BoxDecoration(
                    color: const Color(0xff29D177),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Refer & Earn",
                          style: GoogleFonts.quicksand(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xffF2F2F2))),
                      Row(
                        children: [
                          Text("Invite your friends & earn 15% off",
                              style: GoogleFonts.quicksand(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xffE8E8E8))),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color(0xffFFFFFF)),
                                 child: SvgPicture.asset(
                                        "assets/icons/Group.svg",
                                        color: const Color(0xff29D177),
                                      ) ,
                                  ),
                                  Expanded(child: SizedBox(
                                    height: 44,
                                    width: 45,
                                    child: Image.asset("assets/images/gift.png")))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const TitleRow(title: "Nearby stores"),
              Container(
                  height: 350,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ListTile(
                        minVerticalPadding: 0,
                        contentPadding: EdgeInsets.zero,
                        leading: Image.asset("assets/images/zcUgjyqEwe8.png"),
                        title: Text(
                          "Freshly Baker",
                          style: GoogleFonts.quicksand(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff323232)),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                             Text(
                              "Sweets, North Indian",
                               style: GoogleFonts.quicksand(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff474747)),
                            
                            ),
                             Text("Site No - 1  |  6.4 kms",
                                  style:  GoogleFonts.quicksand(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff323232))),
                            ElevatedButton(
                              
                              style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(EdgeInsets.all(8)),
                                 minimumSize: MaterialStatePropertyAll(Size(48, 16)),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xffDEDEDE))),
                              onPressed: () {},
                              child: Text("Top Store",
                                  style: GoogleFonts.roboto(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff505050))),
                            ),
                            const Divider(
                                thickness: 1, color: Color(0xffDEDEDE)),
                            Row(
                              
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/Vector (7).svg",
                                      ),
                                       Text("Upto 10% OFF",
                                            style:  GoogleFonts.quicksand(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff323232))),
                                    ],
                                  ),
                                ),
                                  const SizedBox(width: 10,),
                                Expanded(
                                  child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/grocery (1) 1.svg",
                                      ),
                                     
                                       Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text("3400+ items available",
                                                style:  GoogleFonts.quicksand(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff323232))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Vectorstar.svg",
                                ),
                                Text(
                                  "4.1",
                                  style: GoogleFonts.quicksand(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff323232)),
                                ),
                              ],
                            ),
                            Text(
                              "45 mins",
                              style: GoogleFonts.quicksand(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xffbEA7E00)),
                            ),
                          ],
                        ),
                      );
                    },
                  )),
                   const SizedBox(height: 20,),
              Center(
              
                child: ElevatedButton(
                  style: const ButtonStyle(
                   
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xff29D177)),
                      minimumSize: MaterialStatePropertyAll(Size(200, 40)),
                     ),
                  onPressed: () {},
                  child: Text("View all stores",
                      style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffFFFFFF))),
                ),
                
              ),
              const SizedBox(height: 39,)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
      
         
    items:  <BottomNavigationBarItem>[
      BottomNavigationBarItem(
            icon:  SvgPicture.asset(
              "assets/icons/Group 198.svg",
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Group 199.svg",
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Group 200.svg",
            ),
            label: 'My Order',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Group 202.svg",
            ),
            label: 'Account',
          ),
    ],
  ),
    );
  }
}
