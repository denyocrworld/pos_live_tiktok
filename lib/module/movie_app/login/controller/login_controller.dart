import 'package:example/core.dart';
import 'package:flutter/material.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String email = "admin@demo.com";
  String password = "123456";
  doLogin() async {
    var response = await Dio().post(
      "http://capekngoding.com:8080/deny/api/auth/action/login",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "email": email,
        "password": password,
      },
    );
    Map obj = response.data;
    print(obj);
    bool isSuccess = obj["success"];
    if (!isSuccess) {
      showInfoDialog("Login gagal bro");
      return;
    }

    showInfoDialog("Login berhasil!");
  }
}
