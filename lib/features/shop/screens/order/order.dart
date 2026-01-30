import 'package:flutter/material.dart';
import 'package:safar_store/common/style/padding.dart';
import 'package:safar_store/common/widgets/appbar/appbar.dart';
import 'package:safar_store/features/shop/screens/order/widgets/orders_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          ' My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      //------[Body]------
      body: Padding(padding: UPadding.screenPadding, child: UOrdersListItems()),
    );
  }
}
