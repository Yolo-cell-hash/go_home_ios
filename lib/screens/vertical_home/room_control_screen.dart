// vertical_home/room_control_screen.dart
// Reusable room control screen widget for Living Room, Kitchen, and Bedroom

import 'package:flutter/cupertino.dart';
import 'utils.dart';

/// Reusable room control screen with back button, title, room image, and control grid
/// Used by Living Room, Kitchen, and Bedroom screens
class RoomControlScreenWidget extends StatelessWidget {
  final String roomName; // Room title (e.g., "Living Room")
  final String
  roomImagePath; // Path to room model image (e.g., "images/living_room_model.png")
  final List<Map<String, dynamic>>
  controlItems; // List of control items with icon and label
  final List<int> statusList; // Status for each item (0=grey, 1=red, 2=green)
  final Function(int index) onItemTap; // Callback when item is tapped
  final Function(int index)?
  onItemLongPress; // Callback when item is long pressed
  final Function() onBackTap; // Callback for back button
  final int gridItemCount; // Number of items in grid
  final int gridCrossAxisCount; // Number of columns (3 for all rooms)
  final bool showHomeButton; // Whether to show home button (for bedroom)
  final Function()? onHomeTap; // Callback for home button

  const RoomControlScreenWidget({
    super.key,
    required this.roomName,
    required this.roomImagePath,
    required this.controlItems,
    required this.statusList,
    required this.onItemTap,
    this.onItemLongPress,
    required this.onBackTap,
    required this.gridItemCount,
    this.gridCrossAxisCount = 3,
    this.showHomeButton = false,
    this.onHomeTap,
  });

  @override
  Widget build(BuildContext context) {
    print('[DEBUG] RoomControlScreenWidget build - room: $roomName');
    final primaryColor = CupertinoTheme.of(context).primaryColor;

    return Container(
      color: CupertinoColors.systemBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button and title
              _buildHeader(primaryColor),
              const SizedBox(height: 40),
              // Content area
              Expanded(
                child: Row(
                  children: [
                    // Left zone - Room image with blast background
                    _buildRoomImageSection(),
                    const SizedBox(width: 40),
                    // Right zone - Control grid
                    _buildControlGrid(primaryColor),
                  ],
                ),
              ),
              // Home button (for bedroom only)
              if (showHomeButton) _buildHomeButton(primaryColor),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds header with back button and room title
  Widget _buildHeader(Color primaryColor) {
    return Row(
      children: [
        // Back button
        GestureDetector(
          onTap: () {
            print('[DEBUG] RoomControlScreen: Back button tapped');
            onBackTap();
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: primaryColor, width: 1.5),
            ),
            child: Icon(
              CupertinoIcons.chevron_left,
              size: 20,
              color: primaryColor,
            ),
          ),
        ),
        const SizedBox(width: 30.0),
        Text(
          roomName,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w500,
            color: primaryColor,
            fontFamily: 'GEG',
          ),
        ),
      ],
    );
  }

  /// Builds the room image section with blast background
  Widget _buildRoomImageSection() {
    return Expanded(
      flex: 1,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Blast background image
            Image.asset('images/blast.png', fit: BoxFit.contain),
            // Room model on top
            Image.asset(roomImagePath, fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }

  /// Builds the control grid with toggle buttons
  Widget _buildControlGrid(Color primaryColor) {
    print(
      '[DEBUG] RoomControlScreen: Building control grid with $gridItemCount items',
    );

    return Expanded(
      flex: 1,
      child: Center(
        child: SizedBox(
          width: 442,
          // height: 600,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridCrossAxisCount,
              mainAxisSpacing: 30,
              crossAxisSpacing: 80,
              childAspectRatio: 0.65,
            ),
            itemCount: gridItemCount,
            itemBuilder: (context, index) {
              final status = statusList[index];
              final isGreen = status == 2;
              final item = controlItems[index];

              return GestureDetector(
                onTap: () {
                  print(
                    '[DEBUG] RoomControlScreen: Item $index tapped - ${item['label']}',
                  );
                  onItemTap(index);
                },
                onLongPress: onItemLongPress != null
                    ? () {
                        print(
                          '[DEBUG] RoomControlScreen: Item $index long pressed - ${item['label']}',
                        );
                        onItemLongPress!(index);
                      }
                    : null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: getStatusColor(status),
                            width: 2,
                          ),
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isGreen
                                ? primaryColor.withOpacity(0.15)
                                : CupertinoColors.systemGrey5,
                            border: Border.all(
                              color: isGreen
                                  ? primaryColor
                                  : CupertinoColors.systemGrey3,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: buildControlItem(
                              item['icon'],
                              isGreen,
                              primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Flexible(
                      flex: 1,
                      child: Text(
                        item['label'],
                        style: TextStyle(
                          fontSize: 16,
                          color: isGreen
                              ? primaryColor
                              : CupertinoColors.systemGrey,
                          fontFamily: 'GEG',
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Builds home button for bedroom screen
  Widget _buildHomeButton(Color primaryColor) {
    print('[DEBUG] RoomControlScreen: Building home button');
    return Center(
      child: GestureDetector(
        onTap: () {
          print('[DEBUG] RoomControlScreen: Home button tapped');
          onHomeTap?.call();
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: primaryColor, width: 1.5),
          ),
          child: Icon(CupertinoIcons.house_fill, size: 24, color: primaryColor),
        ),
      ),
    );
  }
}
