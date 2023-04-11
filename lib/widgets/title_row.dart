import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleRow extends StatelessWidget {
 final String title;

  const TitleRow({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style:  GoogleFonts.quicksand(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: const Color(0xff323232)),),
        TextButton(onPressed: () {
          
        }, child: Text("See all",style:  GoogleFonts.quicksand(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: const Color(0xff06C25E))),)
      ],
    );
  }
}