import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretium/screens/onboarding_screen.dart';

class OnboardingWidget extends ConsumerWidget {
  final String iconText;
  final String boldText;
  final String text;
  final String buttonText;
  final PageController pageController;
 
  const OnboardingWidget({
    super.key,
    required this.iconText,
    required this.boldText,
    required this.text,
    required this.buttonText,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xFF747474),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Image.asset(iconText, height: 150),
                SizedBox(height: 10),
                Text(
                  boldText,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(text, style: TextStyle(fontSize: 16)),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return currentIndex == index
                        ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Container(
                            height: 8,
                            width: 25,
                            decoration: BoxDecoration(
                              color: Color(0xFF15645e),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        )
                        : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Color(0xFFd0e1dd),
                              shape: BoxShape.circle,
                            ),
                          ),
                        );
                  }),
                ),
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (currentIndex == 2) {
                          Navigator.pushReplacementNamed(context, '/login');
                        } else {
                          pageController.nextPage(
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF15645e),
                        foregroundColor: Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
