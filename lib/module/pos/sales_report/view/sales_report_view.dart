import 'package:flutter/material.dart';
import 'package:example/core.dart';
import '../controller/sales_report_controller.dart';

class SalesReportView extends StatefulWidget {
  const SalesReportView({Key? key}) : super(key: key);

  Widget build(context, SalesReportController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("SalesReport"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<SalesReportView> createState() => SalesReportController();
}