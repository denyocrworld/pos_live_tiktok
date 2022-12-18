import 'package:flutter/material.dart';
import 'package:example/core.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  Widget build(context, MainNavigationController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 3,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: const [
            DashboardView(),
            SalesReportView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: (index) {
            controller.selectedIndex = index;
            controller.setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              label: "Dashboard",
              icon: Icon(
                MdiIcons.viewDashboard,
              ),
            ),
            BottomNavigationBarItem(
              label: "Order",
              icon: Icon(
                Icons.list,
              ),
            ),
            BottomNavigationBarItem(
              label: "Me",
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
