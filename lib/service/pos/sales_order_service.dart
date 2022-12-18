import 'package:example/service/local_storage_service.dart';
import 'package:example/service/pos/product_service.dart';

class SalesOrderService {
  static List salesOrderList = [];
  static saveToLocalStorage() async {
    await mainStorage.put("sales_orders", salesOrderList);
  }

  static loadDataFromDB() async {
    salesOrderList = await mainStorage.get("sales_orders") ?? [];
  }

  static checkout({
    required List productList,
  }) async {
    //menyimpan data ke db purchase
    salesOrderList.add({
      "created_at": DateTime.now().toString(),
      "items": productList,
      "total": ProductService.total,
    });
    saveToLocalStorage();
    //mengupdate stock
    for (var product in productList) {
      ProductService.reduceStock(
        id: product["id"],
        qty: product["qty"],
      );
    }
  }
}
