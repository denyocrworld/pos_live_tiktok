import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/sales_report_view.dart';

class SalesReportController extends State<SalesReportView> implements MvcController {
  static late SalesReportController instance;
  late SalesReportView view;

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