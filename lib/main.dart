import 'package:example/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/*
! BANTU TAP n SHARE GAES~

! YOUTUBE: CAPEK NGODING

! LINK KOMUNITAS
? https://tinyurl.com/join-berandal

! LINK KELAS ONLINE (8x Gmeet)
? https://capekngoding.com 

- 1000 halaman X
Ngoding itu kayak main Gitar,
Gak mungkin lo bisa main gitar,
Kalo jarang main gitar

Bahkan kalo lo hafal semua buku Gitar


100 jam, 1000 jam, 10k jam
POS / Inventory App
Master Data
- Product CRUD X

(Produk, Stok, Terjual)
- Transaksi (POS)
> Purchase Order | Transaksi Pembelian (+stok bertambah)
> Sales Transaction | Transaksi Penjualan (-stok berkurang)

- Report
> Sales Report
> Stock Report

Data:
- Kita simpen ke localStorage (hive)

Service
- ProductService
- OrderService
*/
void main() async {
  await initialize();
  // windows, android, ios
  if (!kIsWeb) {
    var path = await getTemporaryDirectory();
    Hive.init(path.path);
  }

  mainStorage = await Hive.openBox('mainStorage');

  //--------
  await ProductService.loadDataFromDB();
  await PurchaseOrderService.loadDataFromDB();
  await SalesOrderService.loadDataFromDB();
  //--------
  return runApp(MaterialApp(
    title: 'POS',
    navigatorKey: Get.navigatorKey,
    debugShowCheckedModeBanner: false,
    theme: getMovieThemeData(),
    home: const MainNavigationView(),
  ));
}
