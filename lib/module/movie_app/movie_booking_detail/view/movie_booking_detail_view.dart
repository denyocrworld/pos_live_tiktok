import 'package:flutter/material.dart';
import 'package:example/core.dart';

class MovieBookingDetailView extends StatefulWidget {
  const MovieBookingDetailView({Key? key}) : super(key: key);

  Widget build(context, MovieBookingDetailController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 24.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.qr_code_scanner,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                "Hangman the Movie",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Season III",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              //Alt+Shift+H
              SizedBox(
                height: 80.0,
                child: ListView.builder(
                  itemCount: controller.hours.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    bool selected = index == 2;

                    List<double> indexList = [30, 15, 0, 15, 30, 40];
                    double margin =
                        indexList.length > index ? indexList[index] : 0;

                    var hour = controller.hours[index];
                    return Container(
                      padding: const EdgeInsets.all(6.0),
                      margin: EdgeInsets.only(
                        top: margin,
                      ),
                      child: Text(
                        "$hour",
                        style: TextStyle(
                          fontSize: selected ? 24.0 : 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(
                            selected ? 1.0 : 0.6,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 30.0,
                width: 90.0,
                transform: Matrix4.translationValues(0.0, -20, 0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1518929458119-e5bf444c30f4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      6.0,
                    ),
                  ),
                ),
              ),
              Text(
                "Screen",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              LayoutBuilder(builder: (context, constraint) {
                var spacingCount = 8.0;
                var rowCount = 10;
                var blockedBlock = [
                  0,
                  1,
                  2,
                  7,
                  8,
                  9,
                  50,
                  51,
                  52,
                  57,
                  58,
                  59,
                ];

                List reservedList = [
                  43,
                  44,
                  45,
                  46,
                  73,
                  74,
                  75,
                  15,
                  16,
                  24,
                  25,
                  26,
                  70,
                  71,
                  21,
                  22,
                  10,
                  11,
                ];
                List selectedList = [47, 48, 49];

                return Wrap(
                  runSpacing: spacingCount,
                  spacing: spacingCount,
                  children: List.generate(
                    80,
                    (index) {
                      var isBlockedBlock = blockedBlock.contains(index);
                      var isReserved = reservedList.contains(index);
                      var isSelected = selectedList.contains(index);

                      var totalSpacing = spacingCount * rowCount;
                      var size =
                          (constraint.biggest.width - totalSpacing) / rowCount;

                      Color color = const Color(0xff1d1d28);
                      if (isBlockedBlock) {
                        color = Colors.transparent;
                      }

                      if (isReserved) {
                        color = Colors.white;
                      }

                      if (isSelected) {
                        color = Colors.red;
                      }
                      return Container(
                        height: size,
                        width: size,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              6.0,
                            ),
                          ),
                        ),
                        // child: Text("$index"),
                      );
                    },
                  ),
                );
              }),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.circle,
                    color: Color(0xff1d1d28),
                    size: 16.0,
                  ),
                  Text(
                    "Available",
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 16.0,
                  ),
                  Text(
                    "Reserved",
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.red,
                    size: 16.0,
                  ),
                  Text(
                    "Selected",
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 52,
        margin: const EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () => Get.to(const MovieBookingDetailView()),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  "Buy ticket",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Container(
                height: 12.0,
                width: 2.0,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                color: Colors.white,
              ),
              const Expanded(
                child: Text(
                  "25 USD",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<MovieBookingDetailView> createState() => MovieBookingDetailController();
}
