import 'package:example/core.dart';

class ProductService {
  static List productList = [];

  static saveToLocalStorage() async {
    await mainStorage.put("products", productList);
  }

  static loadDataFromDB() async {
    productList = await mainStorage.get("products") ?? [];
  }

  static clearQty() async {
    for (var product in productList) {
      product["qty"] = 0;
    }
  }

  static double get total {
    var productTotal = 0.0;
    for (var product in productList) {
      productTotal += product["qty"] * product["price"];
    }
    return productTotal;
  }

  static addProduct({
    required String photo,
    required String productName,
    required double price,
    required String description,
  }) {
    productList.add({
      "id": const Uuid().v4(),
      "photo": photo,
      "product_name": productName,
      "price": price,
      "description": description,
    });
    saveToLocalStorage();
  }

  static updateProduct({
    required String id,
    required String photo,
    required String productName,
    required double price,
    required String description,
  }) {
    var targetIndex = productList.indexWhere((product) => product["id"] == id);
    productList[targetIndex] = {
      "id": id,
      "photo": photo,
      "product_name": productName,
      "price": price,
      "description": description,
      "stock": 0,
    };
    saveToLocalStorage();
  }

  static deleteProduct(String id) {
    productList.removeWhere((product) => product["id"] == id);
    saveToLocalStorage();
  }

  static addStock({
    required String id,
    required int qty,
  }) {
    var targetIndex = productList.indexWhere((product) => product["id"] == id);
    var currentStock = productList[targetIndex]["stock"];
    var newStock = currentStock + qty;
    productList[targetIndex]["stock"] = newStock;

    print(productList[targetIndex]);
    saveToLocalStorage();
  }

  static reduceStock({
    required String id,
    required int qty,
  }) {
    var targetIndex = productList.indexWhere((product) => product["id"] == id);
    var currentStock = productList[targetIndex]["stock"];
    var newStock = currentStock - qty;
    productList[targetIndex]["stock"] = newStock;

    print(productList[targetIndex]);
    saveToLocalStorage();
  }
}
