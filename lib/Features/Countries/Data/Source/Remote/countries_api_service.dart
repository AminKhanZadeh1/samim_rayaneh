import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:samim_rayaneh/Config/API/api_config.dart';
import 'package:samim_rayaneh/Core/Failures/handle_dio_error.dart';

class CountriesApiService {
  final Dio dio;

  CountriesApiService({required this.dio});

  Future<Either<Failure, List<Map<String, dynamic>>>> getCountries() async {
    try {
      final response = await dio.get(ApiConfig.baseUrl);

      if (response.statusCode == 200) {
        final List<dynamic>? rawData = jsonDecode(response.data);
        if (rawData == null || rawData.isEmpty) {
          return Left(ServerFailure('Empty response from server'));
        }
        final data = rawData.map((e) => Map<String, dynamic>.from(e)).toList();
        return Right(data);
      } else {
        return Left(ServerFailure('Failed to load countries'));
      }
    } on DioException catch (e) {
      return Left(handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure('Unexpected error occurred: $e'));
    }
  }
}
