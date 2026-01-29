// vertical_home/bed_storage_screen.dart
// Bed Storage control screen

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:godrej_home/widgets/navbar_setup.dart';

/// Bed Storage control screen
class BedStorageScreen extends StatefulWidget {
  const BedStorageScreen({super.key});

  @override
  State<BedStorageScreen> createState() => _BedStorageScreenState();
}

class _BedStorageScreenState extends State<BedStorageScreen> {
  // Track selected button: 0=OPEN, 1=STOP, 2=CLOSE, -1=none
  int _selectedButton = -1;

  @override
  Widget build(BuildContext context) {
    final primaryColor = CupertinoTheme.of(context).primaryColor;
    final theme = CupertinoTheme.of(context);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: Column(
        children: [
          // Use existing NavbarSetup widget
          NavbarSetup(theme: theme, imgPath: 'bedroom', label: 'Bed Storage'),

          // Main content area
          Expanded(
            child: Container(
              color: CupertinoColors.systemBackground,
              padding: EdgeInsets.only(
                left: 60.0,
                top: 30.0,
                bottom: 30.0,
                right: 0.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title with icon - "Bed Storage"
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'images/bed_small.png',
                          height: 24.0,
                          width: 24.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Bed Storage',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  // Main content row
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left section: Image and control buttons
                        Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF2F1EC),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 15,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      'images/bed_storage_big.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                // Right half: Three circular buttons
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 20),
                                      _buildCircularButton(
                                        label: 'OPEN',
                                        primaryColor: primaryColor,
                                        isSelected: _selectedButton == 0,
                                        onTap: () {
                                          setState(() {
                                            _selectedButton = 0;
                                          });
                                        },
                                      ),
                                      SizedBox(height: 50.0),
                                      _buildCircularButton(
                                        label: 'STOP',
                                        primaryColor: primaryColor,
                                        isSelected: _selectedButton == 1,
                                        onTap: () {
                                          setState(() {
                                            _selectedButton = 1;
                                          });
                                        },
                                      ),
                                      SizedBox(height: 50.0),
                                      _buildCircularButton(
                                        label: 'CLOSE',
                                        primaryColor: primaryColor,
                                        isSelected: _selectedButton == 2,
                                        onTap: () {
                                          setState(() {
                                            _selectedButton = 2;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 30),

                        // Right section: Control buttons grid
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Container(
                              height: 250.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F1EC),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 50,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // First row: Safety, Timer, Maintenance
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildElegantButton(
                                          icon: CupertinoIcons.shield,
                                          label: 'Safety',
                                          primaryColor: primaryColor,
                                          onTap: () {
                                            // Handle safety
                                          },
                                        ),
                                        _buildElegantButton(
                                          icon: CupertinoIcons.timer,
                                          label: 'Timer',
                                          primaryColor: primaryColor,
                                          onTap: () {
                                            // Handle timer
                                          },
                                        ),
                                        _buildElegantButton(
                                          icon: CupertinoIcons.settings,
                                          label: 'Maintenance',
                                          primaryColor: primaryColor,
                                          onTap: () {
                                            // Handle maintenance
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
        ],
      ),
    );
  }

  Widget _buildCircularButton({
    required String label,
    required Color primaryColor,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    // Default color #E5E4DD, selected uses primaryColor
    final buttonColor = isSelected ? primaryColor : Color(0xFFE5E4DD);
    final textColor = isSelected ? Colors.white : primaryColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: Offset(0, 4),
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildElegantButton({
    IconData? icon,
    String? imagePath,
    required String label,
    required Color primaryColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: imagePath != null
                ? Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(imagePath, color: Colors.white),
                  )
                : Icon(icon, color: Colors.white, size: 32),
          ),
          SizedBox(height: 15),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'GEG',
              fontSize: 16.0,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
