import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/Models/travel_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List
  int selectedIndex = 0;
  double imageSize = 60;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: (size.height) / 1.9,
              color: Colors.white,
              child: Stack(
                children: [
                  //////////////////////////////////////////////////////////////
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: MainImage(size: size, selectedIndex: selectedIndex),
                  ),
                  //////////////////////////////////////////////////////////////
                  Positioned(
                    bottom: 40,
                    right: 10,
                    child: SizedBox(
                      height: 315,
                      width: 100,
                      // color: Colors.green,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: travelList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: AnimatedContainer(
                                height: (selectedIndex == index)
                                    ? imageSize + 10
                                    : imageSize,
                                width: (selectedIndex == index)
                                    ? imageSize + 10
                                    : imageSize,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(travelList[index].img!),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    (index == selectedIndex)
                                        ? const Radius.circular(1000)
                                        : const Radius.circular(15),
                                  ),
                                  border: Border.all(
                                    color: (index == selectedIndex)
                                        ? Colors.yellow
                                        : Colors.white,
                                    width: 3,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 100),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  //////////////////////////////////////////////////////////////
                  const Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: TopButtons(),
                  ),
                  //////////////////////////////////////////////////////////////
                  Positioned(
                    left: (size.width) / 11,
                    bottom: (size.height) / 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          travelList[selectedIndex].name!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.location_solid,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              travelList[selectedIndex].location!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //////////////////////////////////////////////////////////////
                ],
              ),
            ),
            //////////////////////////////////////////////////////////////////////////////////////
            //////////////////////////////////////////////////////////////////////////////////////
            Expanded(
              child: Container(
                width: double.maxFinite,
                height: (size.height) / 1.8,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Text("${travelList[selectedIndex].distance!} km"),

                        InformationBox(
                          selectedIndex: selectedIndex,
                          boxTitle: 'Distance',
                          boxInformation: "${travelList[selectedIndex].distance!} km",
                        ),
                        InformationBox(
                          selectedIndex: selectedIndex,
                          boxTitle: 'Temp',
                          boxInformation: "${travelList[selectedIndex].temp!}\u00B0 C",
                        ),
                        InformationBox(
                          selectedIndex: selectedIndex,
                          boxTitle: 'Rate',
                          boxInformation: "${travelList[selectedIndex].rating!}",
                        ),
                      ],
                    ),
                    ////////////////////////////////////////////////////////////
                    // Text("data",)
                    ////////////////////////////////////////////////////////////
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InformationBox extends StatelessWidget {
  final String boxTitle;
  final String boxInformation;
  final int selectedIndex;

  const InformationBox({
    super.key,
    required this.selectedIndex,
    required this.boxTitle,
    required this.boxInformation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          width: 1,
          color: Color.fromARGB(40, 0, 0, 0),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        width: 90,
        height: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(boxTitle),
            Text(boxInformation),
            // Text("${travelList[selectedIndex].distance!} km"),
          ],
        ),
      ),
    );
  }
}

class MainImage extends StatelessWidget {
  MainImage({
    super.key,
    required this.size,
    required this.selectedIndex,
  });

  Size size;
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: (size.height) / 2.4,
      decoration: BoxDecoration(
        // color: Colors.green,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        image: DecorationImage(
          image: AssetImage(travelList[selectedIndex].img!),
          fit: BoxFit.fill,
        ),
      ),

      // child: Image.asset(
      //   "assets/images/NewYork.jpg",
      //   fit: BoxFit.fill,
      //
      // ),
    );
  }
}

class TopButtons extends StatelessWidget {
  const TopButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(190, 173, 172, 172),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              CupertinoIcons.left_chevron,
              color: Colors.black,
            ),
          ),
          //////////////////////
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(190, 173, 172, 172),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              CupertinoIcons.heart,
              color: Colors.black,
            ),
          ),
          ////////////////////////
        ],
      ),
    );
  }
}
