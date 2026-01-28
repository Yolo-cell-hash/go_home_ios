/// Log entry model for API logging
class LogEntry {
  final String timestamp;
  final String action;
  final int statusCode;
  final String response;
  final bool isSuccess;

  LogEntry({
    required this.timestamp,
    required this.action,
    required this.statusCode,
    required this.response,
    required this.isSuccess,
  });

  @override
  String toString() {
    return 'LogEntry(timestamp: $timestamp, action: $action, statusCode: $statusCode, isSuccess: $isSuccess)';
  }
}
