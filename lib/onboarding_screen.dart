// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:languagelearningapp/core/helper/spacer.dart';
import 'package:languagelearningapp/core/theme/my_colors.dart';
import 'package:languagelearningapp/core/theme/my_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              pageViewStyle(
                imagePath: "assets/images/boarding1.png",
                title: "Confidence in your words",
                description:
                    "With conversation-based learning,\n you'll be talking from lesson one",
              ),
              pageViewStyle(
                imagePath: "assets/images/boarding2.png",
                title: "Take your time to learn",
                description:
                    "Develop a habit of learning and\n make it a part of your daily routine",
              ),
              pageViewStyle(
                imagePath: "assets/images/boarding3.png",
                title: "The lessons you need to learn",
                description:
                    "Using a variety of learning styles to learn\n and retain",
              ),
            ],
          ),
          Positioned(
            bottom: 370.h,
            left: MediaQuery.of(context).size.width * 0.44,
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: MyColors.orange,
                dotColor: Colors.white.withOpacity(0.5),
                dotHeight: 8.h,
                dotWidth: 8.w,
                expansionFactor: 1.00001,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class pageViewStyle extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  pageViewStyle({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.darkblue,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      child: Column(
        children: [
          verticalSpacer(100),
          Image.asset(imagePath, width: 240.w, height: 220.h),
          verticalSpacer(130),
          Text(title, style: MyFonts.font22w600white),
          verticalSpacer(8),
          Text(
            description,
            style: MyFonts.font15w400grey,
            textAlign: TextAlign.center,
          ),
          verticalSpacer(32),
          MaterialButton(
            color: MyColors.whiteBlue,
            height: 56.h,
            minWidth: MediaQuery.of(context).size.width,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            onPressed: () {},
            child: Text('Choose a language', style: MyFonts.font20w500white),
          ),
          verticalSpacer(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already a fillolearn user?', style: MyFonts.font15w400grey),
              TextButton(
                onPressed: () {},
                child: Text('Log in', style: MyFonts.font15w400Blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
