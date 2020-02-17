import 'package:dartz/dartz.dart';
import 'package:numberQuote/core/error/failure.dart';
import 'package:numberQuote/core/usecase/usecase.dart';
import 'package:numberQuote/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:numberQuote/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia extends Usecase<NumberTrivia, NoParams> {
  final NumberTriviaRepository numberTriviaRepository;

  GetRandomNumberTrivia(this.numberTriviaRepository);

  Future<Either<Failure, NumberTrivia>> call(NoParams noParams) {
    return numberTriviaRepository.getRandomNumberTrivia();
  }
}
