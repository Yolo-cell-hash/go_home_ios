// services/vdb_firebase_service.dart
// Firebase utilities for VDB - cloned from vdp-sdk-aws-migration

import 'package:firebase_database/firebase_database.dart';

/// Firebase service for VDB configuration and control
class VdbFirebaseService {
  final String fbUrl =
      "https://vdb-poc-default-rtdb.asia-southeast1.firebasedatabase.app/";

  /// Read IPv6 address from Firebase Realtime Database
  Future<String?> readIpv6() async {
    try {
      final dbRef = FirebaseDatabase.instance.ref('dev_env/ipv6');
      final snapshot = await dbRef.get();
      if (snapshot.exists) {
        final ip = snapshot.value as String;
        print("IP FETCHED FROM FB - $ip");
        return ip;
      }
      return null;
    } catch (e) {
      print("Error reading IPv6: $e");
      return null;
    }
  }

  /// Enable video feed transmission
  Future<void> enableSendFeed() async {
    try {
      final dbRef = FirebaseDatabase.instance.ref('dev_env/sendFeed');
      await dbRef.set(true);
      print("sendFeed field set to true");
    } catch (e) {
      print("Error toggling sendFeed: $e");
    }
  }

  /// Disable video feed transmission
  Future<void> disableSendFeed() async {
    try {
      final dbRef = FirebaseDatabase.instance.ref('dev_env/sendFeed');
      await dbRef.set(false);
      print("sendFeed field set to false");
    } catch (e) {
      print("Error toggling sendFeed: $e");
    }
  }

  /// Get Firebase database instance
  FirebaseDatabase get database {
    return FirebaseDatabase.instance;
  }
}
