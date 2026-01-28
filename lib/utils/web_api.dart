import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:godrej_home/utils/app_state.dart';
import 'package:godrej_home/utils/log_entry.dart';

enum UserType { ONE_TIME, PERMANENT, TEMPORARY, SCHEDULED }

class WebApi {
  static const String apiKey = 'e8q0y264i3nxjw2pn9p2pxtbo0ub4n3b';
  static const String baseUrl = 'https://hmut-api-gdb2c.binary-labs.in';
  dynamic response = '';
  dynamic tokens;

  // Callback to send logs to UI
  Function(LogEntry)? onLogAdded;

  // Helper method to show toast
  void _showToast(String message, bool isSuccess) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // Helper method to add log
  void _addLog(String action, int statusCode, String response, bool isSuccess) {
    final now = DateTime.now().toUtc();
    final timestamp =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

    if (onLogAdded != null) {
      onLogAdded!(
        LogEntry(
          timestamp: timestamp,
          action: action,
          statusCode: statusCode,
          response: response,
          isSuccess: isSuccess,
        ),
      );
    }
  }

  // Safe method to hide loader
  void _safeHideLoader(BuildContext context) {
    try {
      if (context.mounted) {
        Provider.of<AppState>(context, listen: false).hideLoader();
      }
    } catch (e) {
      print('Error hiding loader: $e');
    }
  }

  // Safe method to show loader
  void _safeShowLoader(BuildContext context) {
    try {
      if (context.mounted) {
        Provider.of<AppState>(context, listen: false).showLoader();
      }
    } catch (e) {
      print('Error showing loader: $e');
    }
  }

  // Webhook functionality
  Future<void> sendWebhook(
    BuildContext context, {
    required String webhookUrl,
    String scenario = 'success',
  }) async {
    _safeShowLoader(context);

    // Get current timestamp in ISO format
    final now = DateTime.now().toUtc();
    final timestamp =
        now.toIso8601String().replaceAll(RegExp(r'\.\d+'), '') + 'Z';

    // Prepare webhook payload
    Map<String, dynamic> webhookPayload = {
      "si_id": "5e25445b-5726-433a-ad02-ae381bb4e87e",
      "lock_id": "3a287d27-3574-4653-a8b6-5ddb0b0ec415",
      "eventId": "c384b6dc-1794-4b5b-8c0a-163322c5d4c7",
      "version": "1.0",
      "eventType": "lock.unlocked",
      "eventTimestamp": timestamp,
      "payload": {
        "device_id": "72ef0d64-fbf3-46ac-a6a4-21a9d40a2a73",
        "user_id": "e0b26b67-5363-4b25-a415-6f9e2b356b92",
        "battery_level": 85,
        "method": "standalone_test",
      },
      "activityTrail": {"action": "unlock"},
      "lockStatus": {"lock_id": "test_lock_abc"},
    };

    String jsonBody = jsonEncode(webhookPayload);

    // Prepare headers based on scenario
    Map<String, String> headers = {};

    if (scenario == 'success') {
      headers = {
        'Content-Type': 'application/json',
        'x-timestamp': timestamp,
        'x-signature': 'q8Y9lwTVqBR5b6SbZCBu2iPYEx0ktR9yodS0c5h7u8g=',
      };
    } else if (scenario == 'bad-request') {
      headers = {
        'Content-Type': 'application/json',
        'x-test-scenario': 'missing-headers',
      };
    } else if (scenario == 'missing-headers') {
      // No headers except content-type will be sent
      headers = {};
    }

    try {
      response = await http.post(
        Uri.parse(webhookUrl),
        headers: headers.isNotEmpty
            ? headers
            : {'Content-Type': 'application/json'},
        body: jsonBody,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      _addLog(
        'Send Webhook ($scenario)',
        response.statusCode,
        response.body,
        response.statusCode == 200,
      );

      _safeHideLoader(context);

      if (response.statusCode == 200) {
        _showToast('Webhook sent successfully!', true);
      } else {
        _showToast('Webhook failed: ${response.statusCode}', false);
      }
    } catch (e) {
      print('Error sending webhook: $e');
      _addLog('Send Webhook ($scenario)', 0, 'Error: $e', false);
      _showToast('Error: $e', false);
      _safeHideLoader(context);
    }
  }

  Future<void> requestOTP(
    BuildContext context, {
    required String phoneNumber,
  }) async {
    _safeShowLoader(context);
    Map<String, String> requestBody = {
      'countryCode': '+91',
      'phoneNumber': phoneNumber,
    };

    String jsonBody = jsonEncode(requestBody);

    print('Requesting OTP for $phoneNumber');
    try {
      response = await http.post(
        Uri.parse('$baseUrl/integrators/v1/auth/request-otp'),
        headers: {'Content-Type': 'application/json', 'x-api-key': apiKey},
        body: jsonBody,
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      _addLog(
        'Request OTP',
        response.statusCode,
        response.body,
        response.statusCode == 200,
      );

      if (response.statusCode == 200) {
        print('Success');
        _showToast('OTP sent successfully!', true);
      } else {
        _showToast('Failed to send OTP', false);
      }
    } catch (e) {
      print('Error making POST request: $e');
      _addLog('Request OTP', 0, 'Error: $e', false);
      _showToast('Error: $e', false);
    } finally {
      _safeHideLoader(context);
    }
  }

  Future<void> verifyOTP(
    BuildContext context, {
    required String phoneNumber,
    required String otp,
  }) async {
    _safeShowLoader(context);
    Map<String, dynamic> requestBody = {
      'countryCode': '+91',
      'phoneNumber': phoneNumber,
      'otp': otp,
    };

    String jsonBody = jsonEncode(requestBody);

    try {
      response = await http.post(
        Uri.parse('$baseUrl/integrators/v1/auth/verify-otp'),
        headers: {'Content-Type': 'application/json', 'x-api-key': apiKey},
        body: jsonBody,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      _addLog(
        'Verify OTP',
        response.statusCode,
        response.body,
        response.statusCode == 200,
      );

      _safeHideLoader(context);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        String? extractedAccessToken = responseData['accessToken'];
        String? extractedRefreshToken = responseData['refreshToken'];
        print(
          'Access Token is ------------------- $extractedAccessToken --------------------------',
        );

        if (extractedAccessToken != null && context.mounted) {
          Provider.of<AppState>(context, listen: false).accessToken =
              extractedAccessToken;
          if (extractedRefreshToken != null) {
            Provider.of<AppState>(context, listen: false).refreshToken =
                extractedRefreshToken;
          }
          _showToast('OTP verified successfully!', true);
          print('Success');
        } else {
          _showToast('Failed to verify OTP', false);
          print('Failure');
        }
      } else {
        _showToast('Invalid OTP', false);
        print('Invalid OTP');
      }
    } catch (e) {
      print('Error - $e');
      _addLog('Verify OTP', 0, 'Error: $e', false);
      _showToast('Error: $e', false);
      _safeHideLoader(context);
    }
  }

  Future<void> getLockList(BuildContext context) async {
    if (!context.mounted) return;

    String accessToken = Provider.of<AppState>(
      context,
      listen: false,
    ).accessToken;

    try {
      response = await http.get(
        Uri.parse('$baseUrl/integrators/v1/lock/list'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      _addLog(
        'Get Lock List',
        response.statusCode,
        response.body,
        response.statusCode == 200,
      );

      if (response.statusCode == 200) {
        List<dynamic> responseData = jsonDecode(response.body);
        Map<String, dynamic> lockId = responseData[0];
        String? _lockId = lockId['lockId'];
        print(
          'Lock ID is ------------------- $_lockId --------------------------',
        );

        if (context.mounted) {
          Provider.of<AppState>(context, listen: false).lockID = _lockId!;
        }
        _showToast('Lock list retrieved successfully!', true);
      } else {
        _showToast('Failed to get lock list', false);
      }
    } catch (e) {
      print('Error making GET request: $e');
      _addLog('Get Lock List', 0, 'Error: $e', false);
      _showToast('Error: $e', false);
    }
  }

  Future<Map<String, dynamic>> unlockDoor(BuildContext context) async {
    if (!context.mounted)
      return {'success': false, 'error': 'Context not mounted'};

    String lockID = Provider.of<AppState>(context, listen: false).lockID;
    String tokens = Provider.of<AppState>(context, listen: false).accessToken;

    Map<String, dynamic> requestBody = {'LOCK_ID': lockID.toString()};

    String jsonBody = jsonEncode(requestBody);

    try {
      response = await http.post(
        Uri.parse('$baseUrl/integrators/v1/lock/${lockID}/unlock-request'),
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': apiKey,
          'Authorization': 'Bearer $tokens',
          'LOCK_ID': lockID,
        },
        body: jsonBody,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      _addLog(
        'Unlock Door',
        response.statusCode,
        response.body,
        response.statusCode == 200,
      );

      if (response.statusCode == 200) {
        print('Lock Unlocked Successfully !!!');
        _showToast('Door unlocked successfully!', true);
        return {'success': true, 'statusCode': response.statusCode};
      } else {
        print('Failed to unlock door');
        _showToast('Failed to unlock door: ${response.statusCode}', false);
        return {
          'success': false,
          'statusCode': response.statusCode,
          'error': response.body,
        };
      }
    } catch (e) {
      print('Error making POST request: $e');
      _addLog('Unlock Door', 0, 'Error: $e', false);
      _showToast('Error: $e', false);
      return {'success': false, 'error': e.toString()};
    }
  }

  Future<void> getActivityTrails(BuildContext context) async {
    _safeShowLoader(context);

    if (!context.mounted) return;

    String accessToken = Provider.of<AppState>(
      context,
      listen: false,
    ).accessToken;
    String lockID = Provider.of<AppState>(context, listen: false).lockID;

    try {
      response = await http.get(
        Uri.parse(
          '$baseUrl/integrators/v1/lock/${lockID}/activity-trail?page=1&limit=50',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      _addLog(
        'Get Activity Trails',
        response.statusCode,
        response.body,
        response.statusCode == 200,
      );

      _safeHideLoader(context);

      if (response.statusCode == 200) {
        _showToast('Activity trails retrieved successfully!', true);
      } else {
        _showToast('Failed to get activity trails', false);
      }
    } catch (e) {
      print('Error making POST request: $e');
      _addLog('Get Activity Trails', 0, 'Error: $e', false);
      _showToast('Error: $e', false);
      _safeHideLoader(context);
    }
  }

  Future<void> getLockStatus(BuildContext context) async {
    _safeShowLoader(context);

    if (!context.mounted) return;

    String accessToken = Provider.of<AppState>(
      context,
      listen: false,
    ).accessToken;
    String lockID = Provider.of<AppState>(context, listen: false).lockID;

    try {
      response = await http.get(
        Uri.parse('$baseUrl/integrators/v1/lock/${lockID}/status'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      _addLog(
        'Get Lock Status',
        response.statusCode,
        response.body,
        response.statusCode == 200,
      );

      _safeHideLoader(context);

      if (response.statusCode == 200) {
        _showToast('Lock status retrieved successfully!', true);
      } else {
        _showToast('Failed to get lock status', false);
      }
    } catch (e) {
      print('Error making POST request: $e');
      _addLog('Get Lock Status', 0, 'Error: $e', false);
      _showToast('Error: $e', false);
      _safeHideLoader(context);
    }
  }

  Future<void> getUsersList(BuildContext context) async {
    _safeShowLoader(context);

    if (!context.mounted) return;

    String accessToken = Provider.of<AppState>(
      context,
      listen: false,
    ).accessToken;
    String lockID = Provider.of<AppState>(context, listen: false).lockID;

    try {
      response = await http.get(
        Uri.parse(
          '$baseUrl/integrators/v1/lock/${lockID}/list-users?type=${UserType.ONE_TIME}',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      _addLog(
        'Get Users List',
        response.statusCode,
        response.body,
        response.statusCode == 200,
      );

      _safeHideLoader(context);

      if (response.statusCode == 200) {
        _showToast('Users list retrieved successfully!', true);
      } else {
        _showToast('Failed to get users list', false);
      }
    } catch (e) {
      print('Error making GET request: $e');
      _addLog('Get Users List', 0, 'Error: $e', false);
      _showToast('Error: $e', false);
      _safeHideLoader(context);
    }
  }

  Future<void> createUser(BuildContext context) async {
    _safeShowLoader(context);

    if (!context.mounted) return;

    String accessToken = Provider.of<AppState>(
      context,
      listen: false,
    ).accessToken;
    String lockID = "a0ab455a-f018-4164-9fd8-37971597b5d4";

    Map<String, dynamic> requestBody = {
      'name': "John Cena",
      'countryCode': "+91",
      'mobileNumber': "7021078739",
      'userType': "ONE_TIME",
    };

    String jsonBody = jsonEncode(requestBody);

    try {
      response = await http.post(
        Uri.parse('$baseUrl/integrators/v1/lock/${lockID}/add-user'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonBody,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      _addLog(
        'Create User',
        response.statusCode,
        response.body,
        response.statusCode == 200 || response.statusCode == 201,
      );

      _safeHideLoader(context);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('User Added Successfully !!!');
        _showToast('User added successfully!', true);
      } else {
        print('Failed to create the new user');
        _showToast('Failed to create user', false);
      }
    } catch (e) {
      print('Error making POST request: $e');
      _addLog('Create User', 0, 'Error: $e', false);
      _showToast('Error: $e', false);
      _safeHideLoader(context);
    }
  }

  // New function to add One-Time User with editable mobile number
  Future<String?> addOneTimeUser(
    BuildContext context, {
    required String name,
    required String countryCode,
    required String mobileNumber,
  }) async {
    _safeShowLoader(context);

    if (!context.mounted) return null;

    String accessToken = Provider.of<AppState>(
      context,
      listen: false,
    ).accessToken;
    String lockID = Provider.of<AppState>(context, listen: false).lockID;

    Map<String, dynamic> requestBody = {
      'name': name,
      'countryCode': countryCode,
      'mobileNumber': mobileNumber,
      'userType': "ONE_TIME",
    };

    String jsonBody = jsonEncode(requestBody);

    try {
      response = await http.post(
        Uri.parse('$baseUrl/integrators/v1/lock/$lockID/add-user'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonBody,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      _addLog(
        'Add One-Time User',
        response.statusCode,
        response.body,
        response.statusCode == 200 || response.statusCode == 201,
      );

      _safeHideLoader(context);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('One-Time User Added Successfully !!!');
        Map<String, dynamic> responseData = jsonDecode(response.body);
        String? passcode = responseData['passcodeValue'];
        print('Passcode: $passcode');
        _showToast('One-time user added successfully!', true);
        return passcode;
      } else {
        print('Failed to create one-time user');
        try {
          Map<String, dynamic> errorData = jsonDecode(response.body);
          String errorMessage = errorData['message'] ?? 'Failed to create user';
          _showToast(errorMessage, false);
        } catch (e) {
          _showToast('Failed to create user', false);
        }
        return null;
      }
    } catch (e) {
      print('Error making POST request: $e');
      _addLog('Add One-Time User', 0, 'Error: $e', false);
      _showToast('Error: $e', false);
      _safeHideLoader(context);
      return null;
    }
  }

  // New function to add Scheduled User with editable parameters
  Future<String?> addScheduledUser(
    BuildContext context, {
    required String name,
    required String countryCode,
    required String mobileNumber,
    required String startDate,
    required String endDate,
    required List<int> daysOfWeek,
    required String fromTime,
    required String toTime,
  }) async {
    _safeShowLoader(context);

    if (!context.mounted) return null;

    String accessToken = Provider.of<AppState>(
      context,
      listen: false,
    ).accessToken;
    String lockID = Provider.of<AppState>(context, listen: false).lockID;

    Map<String, dynamic> requestBody = {
      'name': name,
      'countryCode': countryCode,
      'mobileNumber': mobileNumber,
      'userType': "SCHEDULED",
      'scheduledUserInput': {
        'startDate': startDate,
        'endDate': endDate,
        'daysOfWeek': daysOfWeek,
        'fromTime': fromTime,
        'toTime': toTime,
      },
    };

    String jsonBody = jsonEncode(requestBody);

    try {
      response = await http.post(
        Uri.parse('$baseUrl/integrators/v1/lock/$lockID/add-user'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonBody,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      _addLog(
        'Add Scheduled User',
        response.statusCode,
        response.body,
        response.statusCode == 200 || response.statusCode == 201,
      );

      _safeHideLoader(context);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Scheduled User Added Successfully !!!');
        Map<String, dynamic> responseData = jsonDecode(response.body);
        String? passcode = responseData['passcodeValue'];
        print('Passcode: $passcode');
        _showToast('Scheduled user added successfully!', true);
        return passcode;
      } else {
        print('Failed to create scheduled user');
        try {
          Map<String, dynamic> errorData = jsonDecode(response.body);
          String errorMessage = errorData['message'] ?? 'Failed to create user';
          _showToast(errorMessage, false);
        } catch (e) {
          _showToast('Failed to create user', false);
        }
        return null;
      }
    } catch (e) {
      print('Error making POST request: $e');
      _addLog('Add Scheduled User', 0, 'Error: $e', false);
      _showToast('Error: $e', false);
      _safeHideLoader(context);
      return null;
    }
  }
}
