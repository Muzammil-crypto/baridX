import 'package:intl/intl.dart';

class DateFormatter {
  /// Format DateTime to a readable format (e.g., Jan 12, 2024)
  static String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  /// Format DateTime to a detailed format (e.g., Jan 12, 2024 at 3:45 PM)
  static String formatDateTime(DateTime date) {
    return DateFormat('MMM dd, yyyy - hh:mm a').format(date);
  }

  /// Convert String to DateTime
  static DateTime? parseDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return DateFormat('yyyy-MM-dd').parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Convert DateTime to API format (e.g., 2024-01-12)
  static String toApiFormat(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
