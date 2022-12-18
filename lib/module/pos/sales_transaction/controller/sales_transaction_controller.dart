import 'package:example/core.dart';
import 'package:flutter/material.dart';

class SalesTransactionController extends State<SalesTransactionView>
    implements MvcController {
  static late SalesTransactionController instance;
  late SalesTransactionView view;

  @override
  void initState() {
    instance = this;
    ProductService.clearQty();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  doCheckout() async {
    var productList =
        ProductService.productList.where((p) => p["qty"] > 0).toList();
    await SalesOrderService.checkout(
      productList: productList,
    );
    Get.back();
    showInfoDialog("Your order is success!");
  }
}
