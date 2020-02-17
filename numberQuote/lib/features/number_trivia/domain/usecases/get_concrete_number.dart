import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:numberQuote/core/error/failure.dart';
import 'package:numberQuote/core/usecase/usecase.dart';
import 'package:numberQuote/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:numberQuote/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia extends Usecase<NumberTrivia, Params> {
  final NumberTriviaRepository numberTriviaRepository;

  GetConcreteNumberTrivia(this.numberTriviaRepository);

  Future<Either<Failure, NumberTrivia>> call(
    Params params,
  ) async {
    return await numberTriviaRepository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({
    @required this.number,
  });

  @override
  List<Object> get props => [number];
}
