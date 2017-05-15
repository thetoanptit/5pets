/**
 * Copyright(C) 2017 docomo Healthcare, Inc. All Rights Reserved.
 */

#ifndef Logging_h
#define Logging_h

// LOGGING MACROS---------------

/**
 * ログレベル コンパイルスイッチ
 * Error    LOGGING_LEVEL_ERROR  【used in
 * release】致命的なエラーが発生した際の異常系の処理で出力する。
 * Info     LOGGING_LEVEL_INFO   【used in
 * release】重要な処理のポイントで出力する。乱用しないこと。
 * Warning  LOGGING_LEVEL_WARNING エラーが発生した際の異常系の処理で出力する。
 * Trace    LOGGING_LEVEL_TRACE   詳細なログ出力に使用する。
 * Debug    LOGGING_LEVEL_DEBUG   デバッグを行う際に一時的に出力するログに使用する。
 * Time     LOGGING_LEVEL_TIME    性能測定時に出力するログ
 */

// デバッグビルド時は TIME 以外のログを全て出力する。
// リリースビルド時は ERROR と INFO のみ出力する。
// (性能測定時は個別で LOGGING_LEVEL_TIME のコンパイルスイッチを有効にする事)
#ifdef DEBUG // デバッグビルド
#define LOGGING_LEVEL_ERROR 1
#define LOGGING_LEVEL_INFO 1
#define LOGGING_LEVEL_WARNING 1
#define LOGGING_LEVEL_TRACE 1
#define LOGGING_LEVEL_DEBUG 1
#define LOGGING_LEVEL_TIME 0
#else // リリースビルド
#define NSLog(...)
#endif

// クラス名・メソッド名・行数出力のON/OF
// デバッグビルド時はクラス名・メソッド名・行数を出力する。
#ifdef DEBUG
#define LOGGING_INCLUDE_CODE_LOCATION 1
#else
#define LOGGING_INCLUDE_CODE_LOCATION 0
#endif

// ログ出力フォーマット定義
#define LOG_FORMAT(fmt, lvl, ...)                                                        \
    NSLog((@"[%@]%s[%d] " fmt), lvl, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

// Errorログ - 致命的なエラーが発生した際の異常系の処理で出力する。
#if defined(LOGGING_LEVEL_ERROR) && LOGGING_LEVEL_ERROR
#define LogError(fmt, ...) LOG_FORMAT(fmt, @"E", ##__VA_ARGS__)
#else
#define LogError(...)
#endif

// Infoログ - 重要な処理のポイントで出力する。乱用しないこと。
#if defined(LOGGING_LEVEL_INFO) && LOGGING_LEVEL_INFO
#define LogInfo(fmt, ...) LOG_FORMAT(fmt, @"I", ##__VA_ARGS__)
#else
#define LogInfo(...)
#endif

// Warningログ - エラーが発生した際の異常系の処理で出力する。
#if defined(LOGGING_LEVEL_WARNING) && LOGGING_LEVEL_WARNING
#define LogWarning(fmt, ...) LOG_FORMAT(fmt, @"W", ##__VA_ARGS__)
#else
#define LogWarning(...)
#endif

// Traceログ - 詳細なログ出力に使用する。
#if defined(LOGGING_LEVEL_TRACE) && LOGGING_LEVEL_TRACE
#define LogTrace(fmt, ...) LOG_FORMAT(fmt, @"T", ##__VA_ARGS__)
#else
#define LogTrace(...)
#endif

// Debugログ - デバッグを行い際に一時的に出力するログに使用する。
#if defined(LOGGING_LEVEL_DEBUG) && LOGGING_LEVEL_DEBUG
#define LogDebug(fmt, ...) LOG_FORMAT(fmt, @"D", ##__VA_ARGS__)
#else
#define LogDebug(...)
#endif

// Timeログ - 性能測定時に出力するログ 出力形式については、エポック秒(1970/1/1
// 00:00からの時間)で表示
#if defined(LOGGING_LEVEL_TIME) && LOGGING_LEVEL_TIME
#define LogTime(fmt, ...)                                                                \
    NSLog((@"[time]%f ms | %s%d | " fmt),                                                \
          ([[NSDate date] timeIntervalSince1970] * 1000), __PRETTY_FUNCTION__, __LINE__, \
          ##__VA_ARGS__)
#else
#define LogTime(...)
#endif

#endif // Logging_h
