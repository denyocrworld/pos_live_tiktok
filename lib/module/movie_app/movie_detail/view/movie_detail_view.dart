import 'package:flutter/material.dart';
import 'package:example/core.dart';

class MovieDetailView extends StatefulWidget {
  const MovieDetailView({Key? key}) : super(key: key);

  Widget build(context, MovieDetailController controller) {
    controller.view = this;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              MdiIcons.bookmarkOutline,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height / 2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1518929458119-e5bf444c30f4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    color: themeScaffoldBackgroundColor.withOpacity(0.4),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Spacer(),
                        Text(
                          "Hangman the Movie",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Season III",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.star,
                        size: 16.0,
                        color: themeWarningColor,
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        "8.3",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: themeWarningColor,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Card(
                        color: themeWarningColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 8.0,
                          ),
                          child: Text(
                            "IMDB 9.1",
                            style: TextStyle(
                              color: themeScaffoldBackgroundColor,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  const Text(
                    "Director: Monkey D Luffy",
                    style: TextStyle(
                      fontSize: 11.0,
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Container(
                    height: 10.0,
                    width: 1.0,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const Expanded(
                    child: Text(
                      "Writer: Ronoroa Zoro",
                      style: TextStyle(
                        fontSize: 11.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Select ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    "Date",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 150.0,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  String customDay = DateFormat("EEE").format(
                    DateTime.now().add(
                      Duration(
                        days: index,
                      ),
                    ),
                  );
                  bool isNotSelected = index != 2;
                  LinearGradient customGradient = const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.redAccent,
                      Colors.red,
                    ],
                  );
                  if (isNotSelected) {
                    customGradient = const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xff22252f),
                        Color(0xff12131e),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      Container(
                        child: Container(
                          height: isNotSelected ? 100 : 120.0,
                          width: isNotSelected ? 70 : 86.0,
                          transform: Matrix4.translationValues(
                            0.0,
                            isNotSelected ? 30 : 0,
                            0,
                          ),
                          margin: const EdgeInsets.only(
                            right: 20.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                16.0,
                              ),
                            ),
                            gradient: customGradient,
                          ),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 12.0,
                                    ),
                                    Text(
                                      customDay,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      "${23 + index}",
                                      style: const TextStyle(
                                        fontSize: 28.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    top: 8.0,
                                  ),
                                  child: const CircleAvatar(
                                    radius: 8.0,
                                    backgroundColor:
                                        themeScaffoldBackgroundColor,
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: -10,
                                bottom: 20,
                                child: CircleAvatar(
                                  radius: 10.0,
                                  backgroundColor: themeScaffoldBackgroundColor,
                                ),
                              ),
                              const Positioned(
                                right: -10,
                                bottom: 20,
                                child: CircleAvatar(
                                  radius: 10.0,
                                  backgroundColor: themeScaffoldBackgroundColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 52,
        margin: const EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () => Get.to(const MovieBookingDetailView()),
          child: const Text("Reservation"),
        ),
      ),
    );
  }

  @override
  State<MovieDetailView> createState() => MovieDetailController();
}
