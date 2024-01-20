
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:lottie/lottie.dart';
import '../../view/screenwed/Productcontroller.dart';
class favoritesScreen extends StatefulWidget{
  @override
  _favoritesScreen createState()=>_favoritesScreen();}

class _favoritesScreen extends State<favoritesScreen>{
 // favoritesScreen({super.key});
 final controlle = Get.find<ProductControlle>();

  @override
  Widget build(BuildContext context) {
    
  
  return Obx((){ if(controlle.cartItems.length==0){return Center(child:Column(children:

      [SizedBox(height: 100),Lottie.asset('assets/lottie/cart.json',width: 300,height: 300),
      Text('Your Favorites Is Empty ...',style: TextStyle(fontSize: 23,color: Colors.grey),)]));
     
     }
  else{return
  Scaffold(
    body:// GetBuilder<ProductControlle>(
      
   //     builder: (controller) =>
     ListView.separated(itemBuilder: ((context, index) {
           final product = controlle.cartItems[index];
   
     return Padding(padding: EdgeInsets.all(10),
    child: SizedBox(width: double.infinity,height: 100,child:Row(
      children: [
      SizedBox(child: Card(clipBehavior: Clip.antiAlias,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
      
      ),
      child: AspectRatio(aspectRatio: 1,child: Image.asset(product.image,fit: BoxFit.cover,),),
      ),),
         SizedBox(width: 15,),
         Expanded(
          flex: 10,
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.price.toString(),
            style:TextStyle(overflow: TextOverflow.ellipsis,color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold) ,
            ),
            SizedBox(height: 10,),
             Text(product.rate,
            style:TextStyle(overflow: TextOverflow.ellipsis,color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold) ,
            )
          ],
         ),
         ),
         Spacer(),
        IconButton( onPressed: () => setState(() {
          
        controlle.removeFromCart(product); }),icon:Icon(Icons.favorite,color: Colors.red,size: 30,))
      ],
     ) ,),
        );

              }
   

  ),
separatorBuilder:  ((context, index) {
       return Divider(color: Colors.grey,thickness: 1,);
}),itemCount:controlle.cartItems.length
   ));}}) ;}
}
