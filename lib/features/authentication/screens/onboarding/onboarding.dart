import 'package:AQGM/features/authentication/screens/login/login.dart';
import 'package:AQGM/features/authentication/screens/onboarding/widgets/image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogInScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: demoData.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardingContent(
                    title: demoData[index].title,
                    description: demoData[index].description,
                    imageStackWidget: demoData[index].imageStackWidget,
                  ),
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController, // Use the PageController
                count: demoData.length,
                effect: const SwapEffect(
                  activeDotColor: Color(0XFF040AB7),
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
                onDotClicked: (index) => _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: 55,
                    width: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_pageIndex == demoData.length - 1) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LogInScreen(),
                            ),
                          );
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: const Color(0XFF040AB7),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Onboard {
  final ImageStackWidget imageStackWidget;
  final String title, description;

  Onboard({
    required this.imageStackWidget,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demoData = [
  Onboard(
    imageStackWidget: const ImageStackWidget(
      path: "assets/images/on_boarding_images/1.png",
    ),
    title: "Welcome to AQGM",
    description:
        "AQGM is your personal study companion powered by AI. Easily generate questions and get instant answers.",
  ),
  Onboard(
    imageStackWidget: const ImageStackWidget(
      path: "assets/images/on_boarding_images/2.png",
    ),
    title: "Ease of Use",
    description: "User inputs the text and the model generates a variety of questions and their answers",
  ),
  Onboard(
    imageStackWidget: const ImageStackWidget(
      path: "assets/images/on_boarding_images/3.png",
    ),
    title: "Profile ",
    description: "display of user information",
  ),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.imageStackWidget,
    required this.title,
    required this.description,
  });

  final ImageStackWidget imageStackWidget;
  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        imageStackWidget,
        const Spacer(),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer()
      ],
    );
  }
}
