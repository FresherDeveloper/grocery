import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/bloc/get_notification_bloc.dart';
import 'package:grocery_app/modelclass/fetch_api_model.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
     context.read<GetNotificationBloc>().add(NotificationApifetch());
    return Scaffold(
     
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
                            "assets/icons/Group 181.svg",
                          ),
          ),
        ),
        backgroundColor:   Color(0xffFFFFFF),
        title: Text("Notifications", style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff323232)),)),
      body:BlocBuilder<GetNotificationBloc, GetNotificationState>(
        
        builder: (context, state) {
           log(state.toString());
        if(state is GetNotificationLoaded){
        
        List<Data> list=state.getModelList;
         if(list.isNotEmpty){
         return ListView.builder(itemBuilder: (context, index) {
         
          return Card(
            child:ListTile(
              leading: Container(
                height: 50,
                width: 50,
                child: Image(
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
    // If the network image fails to load, return a fallback image.
    return Image.network('https://www.kubookstore.com/sca-dev-2020-2-0/img/no_image_available.jpeg?resizeid=5&resizeh=1200&resizew=1200',);
  },
          image: NetworkImage(state.getModelList[index].image!,),
        
        )
                //  Image.network(
                //               state.getModelList[index].image!
                //             ),
              ),
                title: Text(state.getModelList[index].title!,style:  GoogleFonts.quicksand(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff323232))),
                subtitle:Text(state.getModelList[index].body!,style:  GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff474747))) ,
               
              ),
          
          );
         },
         itemCount: list.length,

         ); 
        }else{
          return const Center(
            child: Text("No data"),
          );
        }
        }
        else if(state is GetNotificationError){
          return Center( child: Text(state.message),);
        }
         else if(state is GetNotificationLoading){
          return Center(child: const CircularProgressIndicator());
        }
        else{
          return const Text("unExpected error occur");
        }
        
        },
      ),
    );
  }
}