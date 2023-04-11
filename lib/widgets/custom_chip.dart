import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomChip extends StatelessWidget {
  const CustomChip({super.key});

  @override
  Widget build(BuildContext context) {
    return     SizedBox(
      width: 48,
      height: 16,
      child:Align(
              alignment: Alignment.topRight,
              child: Chip(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                label: SizedBox(
                  width: 100,
                   height: 25,
                   
                  child: Text(
                    '10% Off',
                      style:  GoogleFonts.quicksand(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xffFFFFFF)),
                  ),
                ),
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.symmetric(horizontal: 10),
                backgroundColor: Color(0xFF9C37EC)
              ),
            )
    );
  }
}