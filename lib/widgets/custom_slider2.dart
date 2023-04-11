

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomSlider2 extends StatefulWidget {
 
  const CustomSlider2({super.key,});

  @override
  State<CustomSlider2> createState() => _CustomSlider2State();
}

class _CustomSlider2State extends State<CustomSlider2> {
  @override
  Widget build(BuildContext context) {
     int activeIndex=0;

    return   CarouselSlider.builder (
              options: CarouselOptions(

                height:250,
                aspectRatio:4/3,
                viewportFraction: 1,
                autoPlay: true,
                enableInfiniteScroll: false,
                autoPlayInterval: const Duration(seconds: 5),
                onPageChanged: (index,reason)=>setState(()=>activeIndex=index),
              ),
              itemCount: 3,

              itemBuilder: (context, itemIndex, realIndex) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width*.9,
                  child: Card(
                    color: const Color(0xff262626),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 27,vertical: 50 ),
                      child: Stack(
                        children: [
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Image.asset("assets/images/This Produce Delivery Service Wants You to Start Eating the _Ugly_ Vegetables Too 1.png",)),
                              Align(
                                alignment: Alignment.topLeft,
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                         
                          Expanded(
                            child: SizedBox(
                              width: 239,
                              height: 54,
                              child: Text("Customer favourite top supermarkets",style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFF2F2F2)
                              ),)),
                          ),
                          GestureDetector(
                            onTap: () {
                              
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                               Text ("Explore",style: GoogleFonts.quicksand(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFfEA7E00)
                              )),
                              SizedBox(width: 5,),
                               SvgPicture.asset(
                                            "assets/icons/Group.svg"
                                              ) ,
                              ],
                            ),
                          )
                         
                        ],
                       ),)
                        ],
                      )
                   
                    ),
                  ),
                );
              },
            );
  }
}