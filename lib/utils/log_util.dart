import "dart:io";

import "package:flutter/foundation.dart";
import "package:logger/logger.dart";

class LogUtil {
  LogUtil.observe();

  static final Logger _logger = Logger(
    printer: HybridPrinter(
      PrettyPrinter(
        methodCount: 2, // number of method calls to be displayed
        errorMethodCount: 5, // number of method calls if stacktrace is provided
        lineLength: 40, // width of the output
        colors: kIsWeb ? true : !Platform.isIOS, // Colorful log messages
        printEmojis: false, // Print an emoji for each log message
        printTime: true, // Should each log print contain a timestamp
      ),
      info: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 0,
        lineLength: 40,
        colors: kIsWeb ? true : !Platform.isIOS, // Colorful log messages
        printEmojis: false,
        printTime: false,
      ),
      verbose: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 0,
        lineLength: 40,
        colors: kIsWeb ? true : !Platform.isIOS, // Colorful log messages
        printEmojis: false,
        printTime: false,
      ),
    ),
  );

  static void verbose<T>(T message) {
    _logger.v(message);
  }

  static void debug<T>(T message) {
    _logger.d(message);
  }

  static void info<T>(T message) {
    _logger.i(message);
  }

  static void warning<T>(
    T message, {
    Object? exception,
    StackTrace? stackTrace,
  }) {
    _logger.w(message, exception, stackTrace);
  }

  static void error<T>(
    T message, {
    Object? exception,
    StackTrace? stackTrace,
  }) {
    _logger.e(message, exception, stackTrace);
  }

  static void wtf<T>(
    T message, {
    Object? exception,
    StackTrace? stackTrace,
  }) {
    _logger.wtf(message, exception, stackTrace);
  }
}
