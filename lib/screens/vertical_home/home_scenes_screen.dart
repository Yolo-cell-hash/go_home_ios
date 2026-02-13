// vertical_home/home_scenes_screen.dart
// Home Scenes & Home Spaces selection screen

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:godrej_home/utils/web_api.dart';
import 'package:godrej_home/utils/app_state.dart';

/// Home Scenes and Home Spaces screen widget
/// Displays preset scenes (morning, night, party, vacation) and room navigation
class HomeScenesScreenWidget extends StatefulWidget {
  final int selectedScene; // Currently selected scene index (-1 for none)
  final bool isLoading; // Loading state for scene selection
  final Function(int index) onSceneSelected; // Callback when scene is tapped
  final Function(int pageIndex) onSpaceNavigate; // Navigate to room page
  final Function() onWashroomTap; // Show alert for washroom

  const HomeScenesScreenWidget({
    super.key,
    required this.selectedScene,
    required this.isLoading,
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
  State<HomeScenesScreenWidget> createState() => _HomeScenesScreenWidgetState();
}

class _HomeScenesScreenWidgetState extends State<HomeScenesScreenWidget> {
  final WebApi _webApi = WebApi();

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
              // Home Scenes Section — double-tap title to open hidden auth menu
              GestureDetector(
                onDoubleTap: () => _showHiddenAuthMenu(context),
                child: _buildSectionTitle('Home Scenes', primaryColor),
              ),
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

  /// Shows the hidden authentication menu dialog
  void _showHiddenAuthMenu(BuildContext parentContext) {
    print('[DEBUG] Hidden auth menu opened');
    showCupertinoModalPopup(
      context: parentContext,
      builder: (BuildContext modalContext) {
        return _HiddenAuthDialog(webApi: _webApi);
      },
    );
  }

  /// Builds the Home Scenes row with 4 preset options
  Widget _buildHomeScenesRow(Color primaryColor) {
    print(
      '[DEBUG] HomeScenesScreen: Building scenes row, selected: ${widget.selectedScene}',
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: HomeScenesScreenWidget.homeScenes.asMap().entries.map((entry) {
        final index = entry.key;
        final scene = entry.value;
        final isSelected = widget.selectedScene == index;

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                print(
                  '[DEBUG] HomeScenesScreen: Scene $index tapped - ${scene['label']}',
                );
                widget.onSceneSelected(index);
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
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            scene['image']!,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Show loading indicator on selected scene
                        if (isSelected && widget.isLoading)
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                color: CupertinoColors.black.withOpacity(0.5),
                                child: const Center(
                                  child: CupertinoActivityIndicator(
                                    radius: 20,
                                    color: CupertinoColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
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
      children: HomeScenesScreenWidget.homeSpaces.asMap().entries.map((entry) {
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
                  widget.onSpaceNavigate(targetPage);
                } else {
                  widget.onWashroomTap();
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

/// Hidden authentication dialog — handles OTP flow + refresh token
class _HiddenAuthDialog extends StatefulWidget {
  final WebApi webApi;

  const _HiddenAuthDialog({required this.webApi});

  @override
  State<_HiddenAuthDialog> createState() => _HiddenAuthDialogState();
}

class _HiddenAuthDialogState extends State<_HiddenAuthDialog> {
  static const String _defaultPhone = '8806435774';

  final TextEditingController _otpController = TextEditingController();

  // Auth flow states
  bool _isProcessing = false;
  bool _otpSent = false;
  bool _isAuthenticated = false;
  String _statusMessage = '';

  @override
  void initState() {
    super.initState();
    // Auto-attempt token refresh on open
    _attemptAutoRefresh();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  /// Try to refresh token silently. If that works, auto-fetch lock list.
  Future<void> _attemptAutoRefresh() async {
    if (!mounted) return;

    final appState = Provider.of<AppState>(context, listen: false);

    // If we already have both tokens and lockID, we're good
    if (appState.accessToken.isNotEmpty && appState.lockID.isNotEmpty) {
      setState(() {
        _isAuthenticated = true;
        _statusMessage = '✅ Already authenticated';
      });
      return;
    }

    // Try refresh token if available
    if (appState.refreshToken.isNotEmpty) {
      setState(() {
        _isProcessing = true;
        _statusMessage = '🔄 Attempting token refresh...';
      });

      bool refreshed = await widget.webApi.refreshAccessToken(context);

      if (refreshed && mounted) {
        setState(() {
          _statusMessage = '🔄 Token refreshed, fetching lock list...';
        });
        await widget.webApi.getLockList(context);

        if (mounted) {
          final updatedState = Provider.of<AppState>(context, listen: false);
          if (updatedState.lockID.isNotEmpty) {
            setState(() {
              _isAuthenticated = true;
              _isProcessing = false;
              _statusMessage = '✅ Authenticated via refresh token';
            });
            return;
          }
        }
      }

      if (mounted) {
        setState(() {
          _isProcessing = false;
          _statusMessage = 'Refresh failed — use OTP below';
        });
      }
    }
  }

  /// Step 1: Request OTP
  Future<void> _requestOTP() async {
    setState(() {
      _isProcessing = true;
      _statusMessage = '📤 Sending OTP to +91-$_defaultPhone...';
    });

    await widget.webApi.requestOTP(context, phoneNumber: _defaultPhone);

    if (mounted) {
      setState(() {
        _isProcessing = false;
        _otpSent = true;
        _statusMessage = '✅ OTP sent! Enter the code below.';
      });
    }
  }

  /// Step 2: Verify OTP → auto-fetch lock list
  Future<void> _verifyOTP() async {
    final otp = _otpController.text.trim();
    if (otp.isEmpty) {
      setState(() => _statusMessage = '⚠️ Please enter the OTP');
      return;
    }

    setState(() {
      _isProcessing = true;
      _statusMessage = '🔐 Verifying OTP...';
    });

    await widget.webApi.verifyOTP(
      context,
      phoneNumber: _defaultPhone,
      otp: otp,
    );

    if (!mounted) return;

    final appState = Provider.of<AppState>(context, listen: false);
    if (appState.accessToken.isNotEmpty) {
      setState(() {
        _statusMessage = '🔄 OTP verified! Fetching lock list...';
      });

      await widget.webApi.getLockList(context);

      if (mounted) {
        final updatedState = Provider.of<AppState>(context, listen: false);
        setState(() {
          _isProcessing = false;
          if (updatedState.lockID.isNotEmpty) {
            _isAuthenticated = true;
            _statusMessage =
                '✅ Fully authenticated!\n'
                'Lock ID: ${updatedState.lockID}\n'
                'Access Token: ${updatedState.accessToken.substring(0, 20)}...';
          } else {
            _statusMessage = '⚠️ OTP verified but lock list fetch failed';
          }
        });
      }
    } else {
      setState(() {
        _isProcessing = false;
        _statusMessage = '❌ OTP verification failed. Try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = CupertinoTheme.of(context).primaryColor;

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground.resolveFrom(context),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '🔒 Advantis IoT9 Auth',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: CupertinoColors.systemGrey,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Phone: +91-$_defaultPhone',
            style: TextStyle(fontSize: 13, color: CupertinoColors.systemGrey),
          ),
          const SizedBox(height: 16),

          // Status message
          if (_statusMessage.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _isAuthenticated
                    ? CupertinoColors.systemGreen.withOpacity(0.1)
                    : CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _statusMessage,
                style: TextStyle(
                  fontSize: 14,
                  color: _isAuthenticated
                      ? CupertinoColors.systemGreen
                      : primaryColor,
                ),
              ),
            ),
          const SizedBox(height: 16),

          // Loading indicator
          if (_isProcessing)
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: CupertinoActivityIndicator(radius: 14),
            ),

          // OTP Input (shown after OTP sent)
          if (_otpSent && !_isAuthenticated) ...[
            CupertinoTextField(
              controller: _otpController,
              placeholder: 'Enter OTP',
              keyboardType: TextInputType.number,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.systemGrey4),
                borderRadius: BorderRadius.circular(10),
              ),
              style: const TextStyle(fontSize: 18, letterSpacing: 4),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
          ],

          // Action buttons
          if (!_isProcessing && !_isAuthenticated)
            _otpSent
                ? Row(
                    children: [
                      Expanded(
                        child: CupertinoButton(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          color: CupertinoColors.systemGrey4,
                          borderRadius: BorderRadius.circular(10),
                          onPressed: _requestOTP,
                          child: const Text(
                            'Resend OTP',
                            style: TextStyle(
                              color: CupertinoColors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CupertinoButton(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          onPressed: _verifyOTP,
                          child: const Text(
                            'Verify OTP',
                            style: TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : CupertinoButton(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    onPressed: _requestOTP,
                    child: const Text(
                      'Send OTP',
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),

          // Done button when authenticated
          if (_isAuthenticated && !_isProcessing)
            CupertinoButton(
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: CupertinoColors.systemGreen,
              borderRadius: BorderRadius.circular(10),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Done',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
