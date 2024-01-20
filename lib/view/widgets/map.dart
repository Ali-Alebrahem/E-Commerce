import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'custom_button.dart';
import 'custom_text_for_field.dart';


class MapSample extends StatefulWidget {
  //LatLng(34.71307611183872, 36.709515228867524)
 // const map({super.key});
//AIzaSyCFbSZs7bpXK9ZfZrigKqXBa4L9vEDB6AM
 @override


  State<MapSample> createState() => MapSampleState();}
 class MapSampleState extends State<MapSample> {
 /* final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();*/
      static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(34.732426, 36.713696),
    zoom: 14.4746,
  );
  
  GoogleMapController ?gmc;
  Set <Marker> mymarkaer={
      Marker(markerId: MarkerId("1"),position:LatLng(34.73627686620171, 36.72075033187866) ),
       Marker(markerId: MarkerId("2"),position:LatLng(34.71307611183872, 36.709515228867524) ,
      
       ),
      
    };
   

/*_____________________________________________*/
RxDouble x=0.0.obs;
 

  
 

    /*________________________________________________________________________________________*/
    RxDouble distancemetr=0.0.obs;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: Container(
            child:  GoogleMap(

              markers:mymarkaer,
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
          onTap: (LatLng){mymarkaer.remove(Marker(markerId: MarkerId('2')));
             mymarkaer.add(Marker(markerId: MarkerId('2'),position:LatLng ));
            setState(() {
                
              });
              },

              onMapCreated: (GoogleMapController controller) {
                 gmc=controller;
              },
            ),
            //40.759769
            //-73.977608
            /*floatingActionButton: FloatingActionButton.extended(
            //  onPressed: _goToTheLake,
              label: const Text('To the lake!'),
              icon: const Icon(Icons.directions_boat),
            ),*/
            width: 411,height: 530, decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      //  color: Color.fromARGB(255, 29, 11, 192),
        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(15),bottomRight:Radius.circular(15) ),
      ),),
        ),
        SizedBox(height: 20,),

         Padding(
           padding: const EdgeInsets.only(left: 10),
           child:Column(children: [ 
            Text('Click on button to see the distance between your location and store.',style: TextStyle(fontSize: 18),),
            SizedBox(height: 10,)
            ,Row(
             children: [
               SizedBox(width: 110,height: 50,child:CustomButton(
                    onPressed: (){ 
                     setState(() {
                         distancemetr=
                      Geolocator.distanceBetween(34.73627686620171, 36.72075033187866,34.71307611183872, 36.709515228867524).obs;
                    double x=distancemetr.value/1000;
                    distancemetr.value=x;
                  

                 

  
                     });
                  
                   
                    
                    },
                      // Do something when the first button is pressed
  
                  text:"Distance"
               ),),
      Container(  margin: EdgeInsets.only(left: 10,right: 10,top: 5),
      height: 50,
      width: 250,
      decoration: BoxDecoration(
      border: Border.all(color: Colors.black,width: 2),
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
     child:Padding(padding: EdgeInsets.only(left: 17,top: 7), child:Obx(() =>  Text('Distance:${distancemetr.toStringAsFixed(2)}Km',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),),
              //${distancemetr.toStringAsFixed(2)} 
              )  ],
           ),],
        ),    
    )],
    );
  }
}