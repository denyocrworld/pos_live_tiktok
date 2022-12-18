import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/movie_detail_view.dart';

class MovieDetailController extends State<MovieDetailView> implements MvcController {
  static late MovieDetailController instance;
  late MovieDetailView view;

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