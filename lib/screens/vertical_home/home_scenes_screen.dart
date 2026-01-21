// vertical_home/home_scenes_screen.dart
// Home Scenes & Home Spaces selection screen

import 'package:flutter/cupertino.dart';

/// Home Scenes and Home Spaces screen widget
/// Displays preset scenes (morning, night, party, vacation) and room navigation
class HomeScenesScreenWidget extends StatelessWidget {
  final int selectedScene; // Currently selected scene index (-1 for none)
  final Function(int index) onSceneSelected; // Callback when scene is tapped
  final Function(int pageIndex) onSpaceNavigate; // Navigate to room page
  final Function() onWashroomTap; // Show alert for washroom

  const HomeScenesScreenWidget({
    super.key,
    required this.selectedScene,
    required this.onSceneSelected,
    required this.onSpaceNavigate,
    required this.onWashroomTap,
  });

  // Home Scenes data
  static const List<Map<String, String>> homeScenes = [
    {'image': 'images/morning_preset.png', 'label': 'Good Morning'},
    {'image': 'images/night_preset.png', 'label': 'Good Night'},
    {'image': 'images/party_preset.png', 'label': 'House Party'},
    {'image': 'images/vaccation_preset.png', 'label': 'Vaccation'},
  ];

  // Home Spaces data with page mapping
  static const List<Map<String, dynamic>> homeSpaces = [
    {
      'image': 'images/living_room_guide.png',
      'label': 'Living Room',
      'page': 2,
    },
    {'image': 'images/kitchen_guide.png', 'label': 'Kitchen', 'page': 3},
    {'image': 'images/bedroom_guide.png', 'label': 'Bedroom', 'page': 4},
    {'image': 'images/washroom_guide.png', 'label': 'Washroom', 'page': null},
  ];

  @override
  Widget build(BuildContext context) {
    print('[DEBUG] HomeScenesScreenWidget build called');
    final primaryColor = CupertinoTheme.of(context).primaryColor;

    return Container(
      color: CupertinoColors.systemBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Home Scenes Section
              _buildSectionTitle('Home Scenes', primaryColor),
              _buildHomeScenesRow(primaryColor),
              const SizedBox(height: 40),
              // Home Spaces Section
              _buildSectionTitle('Home Spaces', primaryColor),
              _buildHomeSpacesRow(context, primaryColor),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds section title text
  Widget _buildSectionTitle(String title, Color primaryColor) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: primaryColor,
        fontFamily: 'GEG',
      ),
    );
  }

  /// Builds the Home Scenes row with 4 preset options
  Widget _buildHomeScenesRow(Color primaryColor) {
    print(
      '[DEBUG] HomeScenesScreen: Building scenes row, selected: $selectedScene',
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: homeScenes.asMap().entries.map((entry) {
        final index = entry.key;
        final scene = entry.value;
        final isSelected = selectedScene == index;

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                print(
                  '[DEBUG] HomeScenesScreen: Scene $index tapped - ${scene['label']}',
                );
                onSceneSelected(index);
              },
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: isSelected
                          ? Border.all(color: primaryColor, width: 5)
                          : null,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        scene['image']!,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    scene['label']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: primaryColor,
                      fontFamily: 'GEG',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  /// Builds the Home Spaces row with room navigation
  Widget _buildHomeSpacesRow(BuildContext context, Color primaryColor) {
    print('[DEBUG] HomeScenesScreen: Building spaces row');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: homeSpaces.asMap().entries.map((entry) {
        final index = entry.key;
        final space = entry.value;
        final targetPage = space['page'] as int?;

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                print(
                  '[DEBUG] HomeScenesScreen: Space $index tapped - ${space['label']}',
                );
                if (targetPage != null) {
                  onSpaceNavigate(targetPage);
                } else {
                  onWashroomTap();
                }
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      space['image']!,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    space['label']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: primaryColor,
                      fontFamily: 'GEG',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
