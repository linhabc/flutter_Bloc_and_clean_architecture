import 'package:dartz/dartz.dart';
import 'package:numberQuote/core/error/failure.dart';
import 'package:numberQuote/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
