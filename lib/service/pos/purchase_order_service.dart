import 'package:example/core.dart';

class PurchaseOrderService {
  static List purchaseOrderList = [];
  static saveToLocalStorage() async {
    await mainStorage.put("purchase_orders", purchaseOrderList);
  }

  static loadDataFromDB() async {
    purchaseOrderList = await mainStorage.get("purchase_orders") ?? [];
  }

  static checkout({
    required List productList,
  }) async {
    //menyimpan data ke db purchase
    purchaseOrderList.add({
      "created_at": DateTime.now().toString(),
      "items": productList,
      "total": ProductService.total,
    });
    saveToLocalStorage();
    //mengupdate stock
    for (var product in productList) {
      ProductService.addStock(
        id: product["id"],
        qty: product["qty"],
      );
    }
  }
}
