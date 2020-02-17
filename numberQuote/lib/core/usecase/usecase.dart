import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:numberQuote/core/error/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => throw UnimplementedError();
}
