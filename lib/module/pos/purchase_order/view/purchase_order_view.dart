import 'package:flutter/material.dart';
import 'package:example/core.dart';

class PurchaseOrderView extends StatefulWidget {
  const PurchaseOrderView({Key? key}) : super(key: key);

  Widget build(context, PurchaseOrderController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Purchase Order"),
        actions: const [],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "${ProductService.total}",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: const Text("Checkout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () => controller.doCheckout(),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              //item_cart
              //Alt+shift+V
              ListView.builder(
                itemCount: ProductService.productList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = ProductService.productList[index];
                  item["qty"] = item["qty"] ?? 0;
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(
                          item["photo"],
                        ),
                      ),
                      title: Text("${item["product_name"]}"),
                      subtitle: Text("${item["price"]} USD"),
                      trailing: SizedBox(
                        width: 120.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 12.0,
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    item["qty"]--;
                                    controller.setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 9.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${item["qty"]}",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 12.0,
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    item["qty"]++;
                                    controller.setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 9.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<PurchaseOrderView> createState() => PurchaseOrderController();
}
