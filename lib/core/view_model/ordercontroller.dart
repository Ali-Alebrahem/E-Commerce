import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final Stream<QuerySnapshot<Map<String, dynamic>>> ordersStream;

  @override
  void onInit() {
    super.onInit();
    ordersStream = _firestore.collection('orders').snapshots();
  }
}
