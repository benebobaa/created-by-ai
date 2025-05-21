// lib/src/core/utils/date_formatter.dart
import 'package:intl/intl.dart';

class AppDateFormatter {
  /// Formats a [DateTime] object into a string like "MMM d, yyyy" (e.g., "Jan 1, 2023").
  static String formatDate(DateTime? date) {
    if (date == null) return '';
    try {
      return DateFormat('MMM d, yyyy').format(date);
    } catch (e) {
      // Handle potential formatting errors, though unlikely with standard formats
      return 'Invalid Date';
    }
  }

  /// Formats a [DateTime] object into a string like "h:mm a" (e.g., "10:30 AM").
  static String formatTime(DateTime? time) {
    if (time == null) return '';
    try {
      return DateFormat('h:mm a').format(time);
    } catch (e) {
      return 'Invalid Time';
    }
  }

  /// Formats a [DateTime] object into a string like "MM/dd/yyyy, h:mm a" (e.g., "01/15/2023, 10:30 AM").
  static String formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return '';
    try {
      return DateFormat('MM/dd/yyyy, h:mm a').format(dateTime);
    } catch (e) {
      return 'Invalid DateTime';
    }
  }

  /// Formats a [DateTime] object into a relative time string (e.g., "2 hours ago", "Yesterday").
  /// This is a simplified example. For more robust relative time, consider a library.
  static String timeAgo(DateTime? dateTime) {
    if (dateTime == null) return '';
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 5) {
      return 'just now';
    } else if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays < 2) {
      return 'Yesterday, ${DateFormat('h:mm a').format(dateTime)}';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago, ${DateFormat('h:mm a').format(dateTime)}';
    } else {
      return formatDate(dateTime); // Default to full date if older than a week
    }
  }
}
