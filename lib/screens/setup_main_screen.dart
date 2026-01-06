import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:godrej_home/widgets/navbar_setup.dart';
import 'package:godrej_home/widgets/setup_carousel.dart';
import 'package:godrej_home/utils/app_state.dart';
import 'package:godrej_home/screens/foyer_main_screen.dart';
import 'package:godrej_home/screens/living_main_screen.dart';
import 'package:godrej_home/screens/bedroom_main_screen.dart';
import 'package:godrej_home/screens/kitchen_main_screen.dart';

class SetupMainScreen extends StatefulWidget {
  const SetupMainScreen({super.key});

  @override
  State<SetupMainScreen> createState() => _SetupMainScreenState();
}

class _SetupMainScreenState extends State<SetupMainScreen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    final appState = Provider.of<AppState>(context);
    String currentMood = appState.mood;

    return SafeArea(
      child: CupertinoPageScaffold(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NavbarSetup(theme: theme, imgPath: currentMood, label: 'My Space'),
            const SizedBox(height: 50.0),
            Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    height: 450,
                    enlargeFactor: 0.4,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.60,
                    autoPlayCurve: Curves.easeInOut,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: [
                    SetupCarousel(path: 'images/image 10.png', id: 'foyer'),
                    SetupCarousel(path: 'images/image 15.png', id: 'living'),
                    SetupCarousel(path: 'images/image 16.png', id: 'bedroom'),
                    SetupCarousel(path: 'images/image 11.png', id: 'kitchen'),
                  ],
                ),
                Positioned(
                  left: 10,
                  child: GestureDetector(
                    onTap: () => _carouselController.previousPage(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: theme.primaryColor,
                          width: 2.5,
                        ),
                        color: theme.scaffoldBackgroundColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        CupertinoIcons.chevron_left,
                        color: theme.primaryColor,
                        size: 20.0,
                        weight: 100.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  child: GestureDetector(
                    onTap: () => _carouselController.nextPage(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.primaryColor,
                          width: 2.5,
                        ),
                      ),
                      child: Icon(
                        CupertinoIcons.chevron_right,
                        color: theme.primaryColor,
                        weight: 100,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBottomItem(0, 'images/Group 132.png', theme),
                    _buildBottomItem(1, 'images/Group 133.png', theme),
                    _buildBottomItem(2, 'images/Group 141.png', theme),
                    _buildBottomItem(3, 'images/Group 135.png', theme),
                    GestureDetector(
                      onTap: () {
                        int previousIndex =
                            _currentIndex; // Store the current index
                        setState(() {
                          _currentIndex =
                              4; // Temporarily select the add button
                        });

                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: const Text('Coming Soon'),
                            content: const Text(
                              'Room addition feature coming soon',
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  setState(() {
                                    _currentIndex = previousIndex;
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: theme.primaryContrastingColor,
                          border: _currentIndex == 4
                              ? Border.all(
                                  color: theme.primaryColor,
                                  width: 2.5,
                                )
                              : null,
                        ),
                        height: _currentIndex == 4 ? 80.0 : 72.0,
                        width: _currentIndex == 4 ? 120.0 : 109.0,
                        child: Icon(
                          CupertinoIcons.add,
                          weight: 5.0,
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomItem(
    int index,
    String imagePath,
    CupertinoThemeData theme,
  ) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        _carouselController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      onDoubleTap: () {
        print('Double tapped');
        switch (index) {
          case 0:
            Navigator.of(context).push(
              CupertinoPageRoute(builder: (context) => const FoyerMainScreen()),
            );
            break;
          case 1:
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const LivingMainScreen(),
              ),
            );
            break;
          case 2:
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const BedroomMainScreen(),
              ),
            );
            break;
          case 3:
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const KitchenMainScreen(),
              ),
            );
            break;
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: isSelected
              ? Border.all(color: theme.primaryColor, width: 2.5)
              : null,
        ),
        child: Image.asset(
          imagePath,
          height: isSelected ? 80.0 : 72.0,
          width: isSelected ? 120.0 : 109.0,
        ),
      ),
    );
  }
}
