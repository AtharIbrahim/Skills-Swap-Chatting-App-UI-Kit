import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skills_swap/common/app_colors.dart';
import 'package:skills_swap/presentation/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:skills_swap/presentation/bottom_nav_bar/clipper.dart';
import 'package:skills_swap/presentation/bottom_nav_bar/constants.dart';
import 'package:skills_swap/presentation/bottom_nav_bar/size_config.dart';
import 'package:skills_swap/presentation/fragments/Profile_fragment.dart';
import 'package:skills_swap/presentation/fragments/message_fragment.dart';
import 'package:skills_swap/presentation/fragments/post_fragment.dart';
import 'package:skills_swap/presentation/fragments/search_fragment.dart';
import 'package:skills_swap/presentation/fragments/settings_fragment.dart';

class FinalView extends StatefulWidget {
  const FinalView({super.key});

  @override
  FinalViewState createState() => FinalViewState();
}

class FinalViewState extends State<FinalView> {
  // Initial Function
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  int _currentIndex = 0;
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void animateToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Change the color of the mobile above appbar status bar
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    // Initialize AppSizes before using it in the build method
    AppSizes().init(context);
    // Define a GlobalKey for Scaffold
    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                controller: pageController,
                children: const [
                  ProfileFragment(),
                  PostFragment(),
                  SearchFragment(),
                  MessageFragment(),
                  SettingsFragment(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: bottomNav(),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNav() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        elevation: 6,
        child: Container(
          height: MediaQuery.of(context).size.width * 0.18,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile
                    BottomNavBTN(
                      onPressed: (val) {
                        animateToPage(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                      icon: Icons.person_outline,
                      currentIndex: _currentIndex,
                      index: 0,
                    ),
                    // Posts
                    BottomNavBTN(
                      onPressed: (val) {
                        animateToPage(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                      icon: Icons.post_add_sharp,
                      currentIndex: _currentIndex,
                      index: 1,
                    ),
                    // Search
                    BottomNavBTN(
                      onPressed: (val) {
                        animateToPage(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                      icon: Icons.search,
                      currentIndex: _currentIndex,
                      index: 2,
                    ),
                    // Messages
                    BottomNavBTN(
                      onPressed: (val) {
                        animateToPage(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                      icon: Icons.message,
                      currentIndex: _currentIndex,
                      index: 3,
                    ),
                    // Settings
                    BottomNavBTN(
                      onPressed: (val) {
                        animateToPage(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                      icon: Icons.settings,
                      currentIndex: _currentIndex,
                      index: 4,
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.decelerate,
                top: 0,
                left: animatedPositionedLEftValue(_currentIndex),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.01,
                      width: MediaQuery.of(context).size.width * 0.12,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        // height: MediaQuery.of(context).size.width * 0.15,
                        // width: MediaQuery.of(context).size.width * 0.12,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: gradient,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
