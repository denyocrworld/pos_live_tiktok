import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/stock_report_view.dart';

class StockReportController extends State<StockReportView> implements MvcController {
  static late StockReportController instance;
  late StockReportView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}