import 'package:flutter/material.dart';
import 'package:example/core.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  Widget build(context, ProductListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductList"),
        actions: const [],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Get.to(const ProductFormView());
          controller.setState(() {});
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              //Alt+Shift+V
              ListView.builder(
                itemCount: ProductService.productList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = ProductService.productList[index];
                  //alt+shift+d
                  return InkWell(
                    onTap: () {},
                    child: Dismissible(
                      key: UniqueKey(),
                      onDismissed: (detail) {},
                      confirmDismiss: (direction) async {
                        bool confirm = false;
                        await showDialog<void>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirm'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text(
                                        'Are you sure you want to delete this item?'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[600],
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("No"),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    confirm = true;
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Yes"),
                                ),
                              ],
                            );
                          },
                        );
                        if (confirm) {
                          controller.deleteItem(item["id"]);
                          return Future.value(true);
                        }
                        return Future.value(false);
                      },
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            backgroundImage: NetworkImage(
                              item["photo"],
                            ),
                          ),
                          title: Text(
                              "${item["product_name"]} (${item["stock"]})"),
                          subtitle: Text("${item["price"]}"),
                          trailing: IconButton(
                            onPressed: () async {
                              await Get.to(ProductFormView(
                                item: item,
                              ));
                              controller.setState(() {});
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 24.0,
                            ),
                          ),
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
  State<ProductListView> createState() => ProductListController();
}
