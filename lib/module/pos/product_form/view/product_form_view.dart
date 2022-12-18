import 'package:flutter/material.dart';
import 'package:example/core.dart';

class ProductFormView extends StatefulWidget {
  final Map? item;
  const ProductFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, ProductFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("${item != null ? "Edit" : "Create"} Product"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text("Save"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () => controller.doSave(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              QImagePicker(
                label: "Photo",
                validator: Validator.required,
                value: controller.photo,
                onChanged: (value) {
                  controller.photo = value;
                },
              ),
              QTextField(
                label: "Product Name",
                validator: Validator.required,
                value: controller.productName,
                onChanged: (value) {
                  controller.productName = value;
                },
              ),
              QNumberField(
                label: "Price",
                validator: Validator.required,
                value: controller.price != null
                    ? controller.price.toString()
                    : null,
                onChanged: (value) {
                  controller.price = double.parse(value);
                },
              ),
              QMemoField(
                label: "Description",
                validator: Validator.required,
                value: controller.description,
                onChanged: (value) {
                  controller.description = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProductFormView> createState() => ProductFormController();
}
