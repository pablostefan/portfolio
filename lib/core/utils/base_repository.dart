import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/core/error/base_failure.dart';

abstract class BaseRepository {
  Future<Either<BaseFailure, E>> tryExecute<E>(Future<E> Function() exec) async {
    try {
      E result = await exec();
      return Right(result);
    } on EmailFailure catch (e) {
      _logErrorResponse(e);
      return Left(e);
    } on Exception {
      final ExceptionFailure exceptionFailure = ExceptionFailure();
      _logErrorResponse(exceptionFailure);
      return Left(exceptionFailure);
    }
  }

  void _logErrorResponse(BaseFailure failure) {
    debugPrint('[ERROR RESPONSE REPOSITORY]\n ${failure.toString()}');
  }
}
