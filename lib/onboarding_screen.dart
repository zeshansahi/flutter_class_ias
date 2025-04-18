import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

int currentIndex = 0;
List<OnboardingItem> onboardingItems = [
  OnboardingItem(
    title: "Choose Products",
    detail:
        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    image: "images/onboarding_one.png",
  ),
  OnboardingItem(
    title: "Make Payment",
    detail:
        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    image: "images/onboarding_two.png",
  ),
  OnboardingItem(
    title: "Get Your Order",
    detail:
        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    image: "images/onboarding_three.png",
  ),
];

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "1/3",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Skip",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Image(image: AssetImage(onboardingItems[currentIndex].image)),
                Text(
                  onboardingItems[currentIndex].title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  textAlign: TextAlign.center,
                  onboardingItems[currentIndex].detail,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFA8A8A9)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Prev",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFA8A8A9))),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: currentIndex==0?35:10,
                      decoration: BoxDecoration(
                          color:currentIndex==0? Color(0xff17223B):Color(0xFFA8A8A9),
                          // color: Color(0xFFA8A8A9),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 10,
                      width: currentIndex==1?35:10,
                      decoration: BoxDecoration(
                          // color: Color(0xff17223B),
                          color:currentIndex==1? Color(0xff17223B):Color(0xFFA8A8A9),

                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 10,
                      width: currentIndex==2?35:10,
                      decoration: BoxDecoration(
                          // color: Color(0xff17223B),
                          color:currentIndex==2? Color(0xff17223B):Color(0xFFA8A8A9),
                          borderRadius: BorderRadius.circular(20)),
                    )
                  ],
                ),
                InkWell(
                  onTap: () => {
                    if (currentIndex < onboardingItems.length - 1)
                      {
                        setState(() {
                          currentIndex++;
                        })
                      }
                  },
                  child: Text("Next",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF83758))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String detail;
  final String image;

  OnboardingItem({
    required this.title,
    required this.detail,
    required this.image,
  });
}
