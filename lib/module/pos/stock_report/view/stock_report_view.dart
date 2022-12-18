import 'package:flutter/material.dart';
import 'package:example/core.dart';
import '../controller/stock_report_controller.dart';

class StockReportView extends StatefulWidget {
  const StockReportView({Key? key}) : super(key: key);

  Widget build(context, StockReportController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("StockReport"),
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
  State<StockReportView> createState() => StockReportController();
}