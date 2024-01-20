import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lottie/lottie.dart';
 final _firestore=FirebaseFirestore.instance;
 late  User signedInUser;

final String admin='alialebrahem@gmail.com';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
final _auth=FirebaseAuth.instance;

void getCurrentUser(){
  try{
  final user=_auth.currentUser;
  if(user!=null){signedInUser=user;}}
  catch(e){print(e);}
}

 final messageTextController=TextEditingController();
  String? messagetext;
  //late  User signedInUser;
   @override
   void initState(){super.initState();
   getCurrentUser();}
 //String signedInUser="Ali";
  

void messagesStream () async{
 await for(var snapshot in _firestore.collection("messages").snapshots()){
 for(var message in snapshot.docs){
  print(message.data());
 }
 }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    //  backgroundColor: Color.fromARGB(255, 144, 252, 153),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('chat'),
   ),
   body:SafeArea(child:Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:[
       Container(padding:EdgeInsets.only(left: 30,top: 30),
         child: Text('We welcome our customers , the admin is available to assist you in any inquiry or problem that may occur with you .',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 136, 131, 130)),),),
   
    
      MessageStremBuilder(),
       Container(
          decoration:BoxDecoration(/*border: Border(top: BorderSide(color: Colors.orange,width: 2),)*/
           border: Border.all(color: Colors.black,width: 2),
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
          ),
  child: 
  Row(children: [ Expanded(child: TextField(controller: messageTextController,onChanged:(value) {
          messagetext=value;
        },

        decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20,),
        hintText: "Write your messagehere...",
        border: InputBorder.none,
       
        ),
        
           )  ), 
     Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(
    shape: BoxShape.circle,color: Color.fromARGB(255, 118, 209, 118),
  ),
       child: IconButton(icon: Icon(Icons.send,color: Color.fromARGB(255, 255, 255, 255),),onPressed: (){messageTextController.clear();
            _firestore.collection("messages").add({'text':messagetext,'sender':signedInUser.email,'recever':admin,
            'time':FieldValue.serverTimestamp(), 
        

           });
         
         //  messagesStream();
          },// child: Text("send",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold
          
         // ,fontSize: 18),))
          ),
     ),
      ],)),
      ]),
      
        )
        // ]//)
         )  ;

         
  }
  
}
class MessageStremBuilder extends StatelessWidget {
  const MessageStremBuilder({super.key});

  @override
  Widget build(BuildContext context) {
   return StreamBuilder<QuerySnapshot>(
       stream: _firestore.collection("messages").where('sender',isEqualTo: signedInUser).where('reciver',isEqualTo:admin ).where('sender',isEqualTo:admin).where('reciver',isEqualTo: signedInUser).orderBy("time").snapshots(),
          builder:(context,snapshot){
            List<MessageLine> messageWidgets=[];
            if(!snapshot.hasData){
      return Center(child: CircularProgressIndicator(backgroundColor: Colors.red,),);
            }
            final messages=snapshot.data!.docs.reversed;
            for( var message in messages ){
             
             final messageText=message.get('text');
            final messageSender=message.get('sender');
            final currentUser=signedInUser.email;
            final messagerecever=message.get('recever');
            final messageWidget=MessageLine(sender: messageSender,text: messageText,isMe:currentUser== messageSender);
            messageWidgets.add(messageWidget);
            }
            return Expanded(child:  ListView( 
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              children:messageWidgets,
              ));
          } ,
        
        );
  }
}


class MessageLine extends StatelessWidget {
  MessageLine({this.sender,this.text,required this.isMe});
final String ?sender;
final String ?text;
bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(crossAxisAlignment:isMe? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Column(
            children: [
            //  Text('$sender'),
              Material(
                elevation: 10,
                borderRadius:isMe? BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)
                
                ,bottomRight:  Radius.circular(30) ): BorderRadius.only(topRight: Radius.circular(30),bottomLeft: Radius.circular(30)
                
                ,bottomRight:  Radius.circular(30) ),
                color:isMe? Colors.blue[800]:Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  child: Text('$text',style: TextStyle(fontSize: 20,color:isMe? Colors.white:Colors.black),),
                )),
            ],
          ),
        ],
      ),
    );
  }
}
 