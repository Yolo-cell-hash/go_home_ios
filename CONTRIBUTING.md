# Contributing to Godrej Home

First off, thank you for considering contributing to Godrej Home! It's people like you that make this smart home application better for everyone.

## Table of Contents

1. [Code of Conduct](#code-of-conduct)
2. [Getting Started](#getting-started)
3. [How Can I Contribute?](#how-can-i-contribute)
4. [Development Workflow](#development-workflow)
5. [Style Guidelines](#style-guidelines)
6. [Commit Guidelines](#commit-guidelines)
7. [Pull Request Process](#pull-request-process)
8. [Testing Guidelines](#testing-guidelines)
9. [Documentation Guidelines](#documentation-guidelines)

## Code of Conduct

### Our Pledge

We are committed to providing a welcoming and inclusive experience for everyone. We expect all contributors to:

- Use welcoming and inclusive language
- Be respectful of differing viewpoints and experiences
- Gracefully accept constructive criticism
- Focus on what is best for the community
- Show empathy towards other community members

### Unacceptable Behavior

- Harassment, trolling, or insulting comments
- Public or private harassment
- Publishing others' private information without permission
- Other conduct which could reasonably be considered inappropriate

## Getting Started

### Prerequisites

Before you begin, ensure you have:

1. **Development Environment**:
   - macOS (for iOS development)
   - Xcode 14.0 or higher
   - Flutter SDK 3.9.0 or higher
   - CocoaPods installed

2. **Accounts**:
   - GitHub account
   - Firebase account (for testing)

3. **Knowledge**:
   - Familiarity with Flutter/Dart
   - Understanding of iOS development
   - Basic knowledge of Firebase
   - Git version control

### Setting Up Your Development Environment

1. **Fork the Repository**:
   ```bash
   # Fork the repo on GitHub, then clone your fork
   git clone https://github.com/YOUR_USERNAME/go_home_ios.git
   cd go_home_ios
   ```

2. **Add Upstream Remote**:
   ```bash
   git remote add upstream https://github.com/Yolo-cell-hash/go_home_ios.git
   ```

3. **Install Dependencies**:
   ```bash
   flutter pub get
   cd ios && pod install && cd ..
   ```

4. **Configure Firebase**:
   - Create a test Firebase project
   - Download `GoogleService-Info.plist`
   - Place it in `ios/Runner/` (don't commit this file)

5. **Run the App**:
   ```bash
   flutter run
   ```

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the existing issues to avoid duplicates.

**Great Bug Reports Include**:
- Clear, descriptive title
- Detailed steps to reproduce
- Expected vs actual behavior
- Screenshots or videos (if applicable)
- Device information (iOS version, device model)
- App version
- Error logs or console output

**Bug Report Template**:
```markdown
**Description**
A clear description of the bug

**Steps to Reproduce**
1. Go to '...'
2. Click on '...'
3. Scroll down to '...'
4. See error

**Expected Behavior**
What you expected to happen

**Actual Behavior**
What actually happened

**Screenshots**
If applicable, add screenshots

**Environment**
- iOS Version: [e.g., 16.0]
- Device: [e.g., iPhone 14 Pro]
- App Version: [e.g., 1.0.0]

**Additional Context**
Any other context about the problem
```

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion:

- Use a clear and descriptive title
- Provide a detailed description of the suggested enhancement
- Explain why this enhancement would be useful
- Include examples or mockups if possible

**Enhancement Template**:
```markdown
**Feature Description**
A clear description of the feature

**Problem It Solves**
What problem does this solve?

**Proposed Solution**
How would you implement this?

**Alternatives Considered**
What other approaches did you consider?

**Additional Context**
Screenshots, mockups, examples, etc.
```

### Your First Code Contribution

Unsure where to begin? Look for issues labeled:
- `good first issue` - Simple issues for beginners
- `help wanted` - Issues where we'd appreciate help
- `bug` - Bug fixes
- `enhancement` - New features

### Pull Requests

1. **Find or Create an Issue**: Before starting work, ensure there's an issue discussing what you want to do
2. **Create a Branch**: Create a feature branch from `main`
3. **Make Your Changes**: Write code following our style guidelines
4. **Test Your Changes**: Ensure all tests pass
5. **Submit PR**: Create a pull request with a clear description

## Development Workflow

### Branch Naming Convention

```
feature/feature-name      # New features
bugfix/bug-description   # Bug fixes
hotfix/critical-fix      # Critical production fixes
docs/documentation-update # Documentation changes
refactor/component-name  # Code refactoring
test/test-description    # Adding tests
```

**Examples**:
```
feature/add-thermostat-control
bugfix/fix-camera-connection-timeout
docs/update-readme-screenshots
refactor/simplify-ble-controller
```

### Working on Your Branch

1. **Create Branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Keep Branch Updated**:
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

3. **Make Commits**:
   ```bash
   git add .
   git commit -m "feat: add thermostat control screen"
   ```

4. **Push to Your Fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

## Style Guidelines

### Dart/Flutter Code Style

Follow the [official Dart style guide](https://dart.dev/guides/language/effective-dart/style).

**Key Points**:

1. **Naming Conventions**:
   ```dart
   // Classes: UpperCamelCase
   class DoorLockScreen extends StatefulWidget { }
   
   // Variables/Functions: lowerCamelCase
   bool isLocked = true;
   void toggleLight() { }
   
   // Constants: lowerCamelCase
   const maxRetryAttempts = 3;
   
   // Private members: prefix with _
   int _currentPage = 0;
   void _initializeCamera() { }
   ```

2. **Formatting**:
   ```bash
   # Use dart format
   dart format .
   
   # Or flutter format
   flutter format .
   ```

3. **Line Length**: Maximum 80 characters (flexible for readability)

4. **Imports**:
   ```dart
   // Order: dart, flutter, packages, relative
   import 'dart:async';
   import 'dart:io';
   
   import 'package:flutter/material.dart';
   import 'package:flutter/cupertino.dart';
   
   import 'package:firebase_database/firebase_database.dart';
   import 'package:provider/provider.dart';
   
   import '../services/camera_service.dart';
   import '../utils/app_state.dart';
   ```

5. **Widget Structure**:
   ```dart
   class ExampleWidget extends StatelessWidget {
     // 1. Constructor
     const ExampleWidget({
       super.key,
       required this.title,
       this.subtitle,
     });
     
     // 2. Final fields
     final String title;
     final String? subtitle;
     
     // 3. Static constants
     static const double padding = 16.0;
     
     // 4. Build method
     @override
     Widget build(BuildContext context) {
       return Container(
         padding: EdgeInsets.all(padding),
         child: Text(title),
       );
     }
     
     // 5. Helper methods (private)
     Widget _buildHeader() { }
   }
   ```

6. **Comments**:
   ```dart
   // Use comments to explain WHY, not WHAT
   
   // Good:
   // Pre-initialize SDK at boot for faster screen loading
   await JACameraService.initializeSDK();
   
   // Bad:
   // Initialize SDK
   await JACameraService.initializeSDK();
   
   // Use doc comments for public APIs
   /// Connects to the camera with the given [cameraId].
   /// 
   /// Returns a [Map] containing connection result.
   /// Throws [CameraException] if connection fails.
   Future<Map<String, dynamic>?> connectCamera(String cameraId) { }
   ```

### File Organization

```
lib/
├── main.dart                    # App entry point
├── screens/                     # UI screens
│   ├── home_screen.dart
│   └── vertical_home/          # Group related screens
│       ├── door_lock_screen.dart
│       └── light_control_screen.dart
├── widgets/                     # Reusable widgets
│   ├── buttons/
│   ├── cards/
│   └── common/
├── services/                    # Business logic
│   ├── camera_service.dart
│   └── notification_service.dart
├── models/                      # Data models
│   └── device_state.dart
├── utils/                       # Utilities
│   ├── constants.dart
│   └── helpers.dart
└── config/                      # Configuration
    └── app_config.dart
```

### iOS/Swift Code Style

For iOS-specific code in `ios/Runner/`:

1. Follow [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
2. Use SwiftFormat if available
3. Prefer Swift over Objective-C for new code

## Commit Guidelines

We follow [Conventional Commits](https://www.conventionalcommits.org/).

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Adding or updating tests
- `chore`: Build process or auxiliary tool changes
- `ci`: CI/CD changes

### Examples

```bash
feat(door-lock): add privacy mode toggle

Add privacy mode functionality that prevents unlocking from outside.
This is useful for enhanced security during night time.

Closes #123

---

fix(camera): resolve connection timeout issue

Camera connection was timing out after 5 seconds. Increased timeout
to 30 seconds and added retry logic.

Fixes #456

---

docs(readme): add installation instructions

Added detailed step-by-step installation guide including Firebase
setup and iOS configuration.

---

refactor(ble): simplify connection state management

Reduced complexity of BLE connection state handling by using a
single stream controller instead of multiple boolean flags.
```

## Pull Request Process

### Before Submitting

1. **Ensure Code Quality**:
   ```bash
   # Format code
   dart format .
   
   # Analyze code
   flutter analyze
   
   # Run tests
   flutter test
   ```

2. **Update Documentation**: Update relevant docs (README, comments, etc.)

3. **Test Thoroughly**: Test on real device if possible

4. **Check Commits**: Ensure commits follow guidelines

### Submitting Pull Request

1. **Create PR**: Open PR from your fork to `main` branch

2. **Fill PR Template**:
   ```markdown
   ## Description
   Brief description of changes
   
   ## Related Issue
   Closes #123
   
   ## Type of Change
   - [ ] Bug fix
   - [ ] New feature
   - [ ] Breaking change
   - [ ] Documentation update
   
   ## Testing
   How was this tested?
   
   ## Screenshots
   If applicable
   
   ## Checklist
   - [ ] Code follows style guidelines
   - [ ] Self-review completed
   - [ ] Comments added for complex code
   - [ ] Documentation updated
   - [ ] No new warnings
   - [ ] Tests added/updated
   - [ ] All tests pass
   ```

3. **Address Review Comments**: Respond to feedback promptly

4. **Keep PR Updated**: Rebase if needed

### PR Review Process

- Reviewers will check:
  - Code quality and style
  - Test coverage
  - Documentation
  - Performance implications
  - Security considerations

- Be patient and respectful during review
- Address feedback constructively
- Make requested changes in new commits

### After Approval

- Maintainer will merge your PR
- Your branch will be deleted
- Celebration! 🎉

## Testing Guidelines

### Unit Tests

Place in `test/` directory:

```dart
// test/services/camera_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:godrej_home/services/camera_service.dart';

void main() {
  group('CameraService', () {
    test('should initialize successfully', () async {
      final result = await JACameraService.initializeSDK();
      expect(result, isTrue);
    });
    
    test('should connect to camera', () async {
      final result = await JACameraService.connectCamera('12345');
      expect(result, isNotNull);
      expect(result!['success'], isTrue);
    });
  });
}
```

### Widget Tests

```dart
// test/widgets/door_lock_button_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/cupertino.dart';

void main() {
  testWidgets('DoorLockButton toggles state', (tester) async {
    bool isLocked = true;
    
    await tester.pumpWidget(
      CupertinoApp(
        home: DoorLockButton(
          isLocked: isLocked,
          onTap: () => isLocked = !isLocked,
        ),
      ),
    );
    
    expect(find.text('Locked'), findsOneWidget);
    await tester.tap(find.byType(DoorLockButton));
    await tester.pump();
    
    expect(isLocked, isFalse);
  });
}
```

### Integration Tests

Place in `integration_test/` directory.

### Running Tests

```bash
# All tests
flutter test

# Specific file
flutter test test/services/camera_service_test.dart

# With coverage
flutter test --coverage

# Integration tests
flutter test integration_test/
```

## Documentation Guidelines

### Code Documentation

1. **Public APIs**: Always document with doc comments
   ```dart
   /// Connects to the smart door lock.
   /// 
   /// Returns `true` if connection successful, `false` otherwise.
   /// Throws [ConnectionException] if device is unreachable.
   /// 
   /// Example:
   /// ```dart
   /// final connected = await connectDoorLock('device-123');
   /// if (connected) {
   ///   print('Connected!');
   /// }
   /// ```
   Future<bool> connectDoorLock(String deviceId) async { }
   ```

2. **Complex Logic**: Add inline comments
   ```dart
   // Throttle writes to avoid overwhelming Firebase
   _colorWriteThrottle?.cancel();
   _colorWriteThrottle = Timer(Duration(milliseconds: 200), () {
     _writeColorToFirebase(color);
   });
   ```

3. **TODOs**: Use TODO comments for future work
   ```dart
   // TODO(username): Add authentication before allowing access
   // TODO: Implement retry logic for failed connections
   ```

### README Updates

When adding features, update README sections:
- Features list
- Usage instructions
- Configuration (if needed)
- Troubleshooting (if applicable)

### ARCHITECTURE.md Updates

For architectural changes, update:
- System diagrams
- Component descriptions
- Data flow diagrams
- Integration patterns

## Questions?

Feel free to:
- Open an issue for questions
- Reach out to maintainers
- Check existing documentation
- Ask in discussions

## Recognition

Contributors will be:
- Listed in contributors section
- Mentioned in release notes
- Appreciated in commit messages

Thank you for contributing to Godrej Home! 🏠✨

---

**Document Version**: 1.0  
**Last Updated**: February 2026
