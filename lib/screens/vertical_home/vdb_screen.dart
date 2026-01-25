// vertical_home/vdb_screen.dart
// VDB (Video Door Bell) control screen

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:godrej_home/widgets/navbar_setup.dart';

/// VDB control screen
class VDBScreen extends StatefulWidget {
  const VDBScreen({super.key});

  @override
  State<VDBScreen> createState() => _VDBScreenState();
}

class _VDBScreenState extends State<VDBScreen> {
  bool isRecording = true;

  @override
  Widget build(BuildContext context) {
    final primaryColor = CupertinoTheme.of(context).primaryColor;
    final theme = CupertinoTheme.of(context);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: Column(
        children: [
          // Use existing NavbarSetup widget
          NavbarSetup(theme: theme, imgPath: 'vdb', label: 'Video Door Bell'),

          // Main content area
          Expanded(
            child: Container(
              color: CupertinoColors.systemBackground,
              padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title with icon - "VDB"
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          CupertinoIcons.video_camera_solid,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'VDB',
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
                        // Left section: Video feed
                        Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 15,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Stack(
                                children: [
                                  // Video feed / image
                                  Positioned.fill(
                                    child: Image.asset(
                                      'images/vdb_feed.png',
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            // Fallback placeholder
                                            return Container(
                                              color: Color(0xFF2C2C2C),
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      CupertinoIcons
                                                          .video_camera_solid,
                                                      size: 80,
                                                      color: Colors.grey[600],
                                                    ),
                                                    SizedBox(height: 15),
                                                    Text(
                                                      'Video Feed',
                                                      style: TextStyle(
                                                        color: Colors.grey[500],
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                    ),
                                  ),

                                  // Recording indicator
                                  Positioned(
                                    top: 20,
                                    right: 20,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              color: isRecording
                                                  ? Colors.red
                                                  : Colors.grey,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'Rec',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 30),

                        // Right section: Elegant control buttons grid
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F0EB), // Warm beige background
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 50,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // First row: Capture & Record
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      _buildElegantButton(
                                        icon: CupertinoIcons.lock_fill,
                                        label: 'Capture',
                                        primaryColor: primaryColor,
                                        onTap: () {
                                          // Handle capture
                                        },
                                      ),
                                      _buildElegantButton(
                                        icon: CupertinoIcons.videocam_fill,
                                        label: 'Record',
                                        primaryColor: primaryColor,
                                        onTap: () {
                                          setState(() {
                                            isRecording = !isRecording;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),

                                // Second row: Feed & Activity Trail
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      _buildElegantButton(
                                        icon: CupertinoIcons.camera_fill,
                                        label: 'Feed',
                                        primaryColor: primaryColor,
                                        onTap: () {
                                          // Handle feed
                                        },
                                      ),
                                      _buildElegantButton(
                                        icon: CupertinoIcons
                                            .arrow_counterclockwise,
                                        label: 'Activity Trail',
                                        primaryColor: primaryColor,
                                        onTap: () {
                                          // Handle activity trail
                                        },
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildElegantButton({
    required IconData icon,
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
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 32),
          ),
          SizedBox(height: 15),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
