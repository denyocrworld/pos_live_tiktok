import 'package:example/core.dart';
import 'package:flutter/material.dart';

class PurchaseOrderController extends State<PurchaseOrderView>
    implements MvcController {
  static late PurchaseOrderController instance;
  late PurchaseOrderView view;

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
    await PurchaseOrderService.checkout(
      productList: productList,
    );
    Get.back();
    showInfoDialog("Your order is success!");
  }
}
