import 'dart:io';
import '/services/api_response.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../constants/globals.dart';
import 'endpoints.dart';

/// API Services
///===
class ApiService {
  static final ApiService _instance = ApiService._internal();
  final Dio _dio = Dio();
  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    _dio.options.baseUrl = Globals.baseUrl;
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': Globals.token,
    };
    _dio.options.contentType = Headers.jsonContentType;
    _dio.options.responseType = ResponseType.json;
    _dio.options.connectTimeout = const Duration(minutes: 5);
    _dio.options.receiveTimeout = const Duration(minutes: 3);

    _dio.interceptors.add(RetryInterceptor(
      dio: _dio,
      logPrint: debugPrint,
      retries: 3,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3),
      ],
    ));

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  // Dio get dio => _dio;

  static ApiService get instance => _instance;
}

extension RemoteService on ApiService {
  /// Get Tranding Movies
  /// -
  Future<ApiResponse> trendingMovies() async {
    late final ApiResponse result;
    try {
      final response = await _dio.get(Endpoints.trandingMovies.path);
      result = ApiResponse(
        data: response.data,
        statusCode: response.statusCode,
        message: response.statusMessage,
        success: response.statusCode == HttpStatus.ok,
      );
    } on DioException catch (e) {
      result = ApiResponse(
        data: e.response?.data,
        statusCode: e.response?.statusCode,
        message: e.response?.statusMessage,
        success: e.response?.statusCode == HttpStatus.ok,
      );
    }
    return result;
  }

  /// Get Movies Detail
  /// -
  Future<ApiResponse> getMoviesDetail(String movieId) async {
    late final ApiResponse result;
    try {
      final response = await _dio.get(Endpoints.movieDetail.path + movieId);
      result = ApiResponse(
        data: response.data,
        statusCode: response.statusCode,
        message: response.statusMessage,
        success: response.statusCode == HttpStatus.ok,
      );
    } on DioException catch (e) {
      result = ApiResponse(
        data: e.response?.data,
        statusCode: e.response?.statusCode,
        message: e.response?.statusMessage,
        success: e.response?.statusCode == HttpStatus.ok,
      );
    }
    return result;
  }

  /// Get Movies Trailers
  /// -
  Future<ApiResponse> getTrailers(String movieId) async {
    late final ApiResponse result;
    try {
      final response = await _dio
          .get(Endpoints.movieDetail.path + movieId + Endpoints.video.path);
      result = ApiResponse(
        data: response.data,
        statusCode: response.statusCode,
        message: response.statusMessage,
        success: response.statusCode == HttpStatus.ok,
      );
    } on DioException catch (e) {
      result = ApiResponse(
        data: e.response?.data,
        statusCode: e.response?.statusCode,
        message: e.response?.statusMessage,
        success: e.response?.statusCode == HttpStatus.ok,
      );
    }
    return result;
  }
}
