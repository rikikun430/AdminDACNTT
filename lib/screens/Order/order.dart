import 'package:adminui/screens/Order/order_list.dart';
import 'package:adminui/utils/app_constants.dart';
import 'package:adminui/utils/dimensions.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: TOrderListItem(),
      ),
    );
  }
}
