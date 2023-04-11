

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomSlider extends StatefulWidget {
  final int itemCount;
  final String image;
  const CustomSlider({super.key, required this.itemCount, required this.image});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
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
              itemCount: widget.itemCount,

              itemBuilder: (context, itemIndex, realIndex) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width*.9,
                  child: Card(
                    color: const Color(0xff06C25E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 27,vertical: 50 ),
                      child: Row(
                       
                        children: [
                       Column(
                      
                        children:  [
                         
                          Expanded(
                            child: SizedBox(
                              width: 126,
                              height: 70,
                              child: Text("DISCOUNT 25% ALL FRUITS",style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFFFFFFF)
                              ),)),
                          ),
                           // SizedBox(height: 50,),
                             FittedBox(
                               fit: BoxFit.fitHeight,
                               child: Container(
                                height:32 ,
                                width: 160,
                                color:const Color(0xffFF8918) ,
                                child:Center(
                                child:  Text("CHECK NOW", style: GoogleFonts.poppins(
                                                         fontSize: 12,
                                                         fontWeight: FontWeight.w600,
                                                         color: Color(0xFFFFFFFF)
                                                         ),)
                                ) ,
                                                         ),
                             )
                           
                        ],
                       ),
                          Expanded(
                            child:   Image.asset(widget.image) ,
                            ),
                          
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
  }
}