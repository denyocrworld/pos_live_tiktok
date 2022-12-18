import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/movie_booking_detail_view.dart';

class MovieBookingDetailController extends State<MovieBookingDetailView>
    implements MvcController {
  static late MovieBookingDetailController instance;
  late MovieBookingDetailView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List hours = [
    "15:00",
    "16:00",
    "17:30",
    "19:30",
    "20:00",
    "21:00",
    "22:00",
    "23:00",
    "24:00",
  ];
}
